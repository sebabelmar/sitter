class UsersController < ApplicationController

  def index
    @user = current_user
    #user timeslots TBD
    @active_friends = @user.friends.map { |friend| friend.family_name if friend.timeslots.count > 0 }.compact
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:notice] = "User couldn't be saved. Please try again."
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "#{@user.first_name} #{@user.last_name} has been deleted."
    @user.destroy
  end

  def search
    timeslot = Timeslot.new
    users = []

    if params[:start_time] != nil
    beg_time = Chronic.parse(params[:start_time]).to_i
      User.all.each do |user|
        user.timeslots.each do |timeslot|
           if (timeslot.start_time..timeslot.end_time).include?(beg_time)
            users << user
          end
        end
      end
    end

    @users = users
  end

  def offer
    @user = current_user
  end

  def send_message_to_friend
    user = current_user
    friend = User.find(params[:friend_id])
    message = "Your friend #{friend.family_name} booked your slot. You are awesome"

    flash[:notice] = "Your message to #{friend.first_name} #{friend.last_name} has been sent!"
    texting = TwilioController.new
    texting.send_message_to(friend.phone_number_one, message)
    redirect_to users_path
    texting.send_message_to(friend.phone_number_one, message)
  end

  def send_emergency
    texting = TwilioController.new
    texting.emergency
    flash[:notice] = "Your CALL was sent! RELAX!"
    redirect_to users_path
  end

  def home
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :family_name, :email, :password, :phone_number_one, :phone_number_two, :zip_code)
  end
end