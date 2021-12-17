class MessageMailer < ApplicationMailer
	def new_alert_email
		@message = params[:message]
    params[:emails].each do |email|
	    mail(to: email, subject: @message.title)
	  end
  end
end
