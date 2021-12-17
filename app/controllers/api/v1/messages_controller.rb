class Api::V1::MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		if @message.save
		  @developers = @message.team.developers
		  @developers_mobile_no = @developers.pluck(:mobile)
		  @developers_email = @developers.pluck(:email)

		  response = TwilioSms.send_text(@developers_mobile_no, message_params[:content])
		  MessageMailer.with(message: @message, emails: @developers_email).new_alert_email.deliver_later

		  if response == "send"
		    render json: @message.to_api
		  else
		  	render json: {error: response.to_json}, status: 400
		  end
		else
      render error: {error: 'Unable to create message.'}, status: 400
    end

  end

  private
  def message_params
  	params.require(:message).permit(:content, :title, :team_id)
  end
end
