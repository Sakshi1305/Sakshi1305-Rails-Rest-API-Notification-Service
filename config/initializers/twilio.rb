require 'rubygems'
require 'twilio-ruby'

module TwilioSms
  def self.send_text(numbers_to_message, content)
    twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']
    begin
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      numbers_to_message.each do |number|
      message =  @twilio_client.api.account.messages.create(
          :from => twilio_phone_number,
          :to => number,
          :body=> content
        )
      end
    rescue Twilio::REST::TwilioError => e
       return e.message
    end
    return "send"
  end
end