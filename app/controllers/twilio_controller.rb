class TwilioController < ApplicationController

  def send_message_to(friend)
    @client = Twilio::REST::Client.new ENV[ACCOUNT_SID], ENV[AUTH_TOKEN]
    @client.account.sms.messages.create(
      :from => '+19288524133',
      :to => friend.phone_number_one,
      :body => 'Your friend #{friend.family_name} needs your help on DATE at TIME')
    )
  end
end
