class TwilioController < ApplicationController
  def initialize
  @account_sid = 'ACbed0d7b5bd4748bc14b3e1cb0cf79bb8'
  @auth_token =  '966df3c36952413de6f5bb41eba236a2'
  @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message_to(friend_phone, message)
    @client.account.messages.create(
      :from => '+14154032561',
      :to => '+19282740117',
      :body => message
    )
  end
end
