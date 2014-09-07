require 'chronic'
class TimeslotsController < ApplicationController
  def new
    @timeslot = Timeslot.new
    @timeslots = Timeslot.all
  end

  def create
    start_time = Chronic.parse(params[:timeslot][:start_time]).to_i
    end_time = start_time + (3600 * params[:timeslot][:duration].to_i )

    timeslot = Timeslot.new(
      start_time: start_time,
      end_time: end_time,
      duration: params[:timeslot][:duration].to_i,
      availability: params[:timeslot][:availability],
      kind: params[:timeslot][:kind]
      )
    if timeslot.save
      flash[:notice] = "You have created a new timeslot."
      # Send text message if kind = need
      redirect_to new_user_timeslot_path
    else
      flash[:notice] = "We couldnt save your timeslot, try again."
      redirect_to new_user_path
    end

  end
end
