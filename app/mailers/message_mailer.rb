class MessageMailer < ApplicationMailer
  default to: ENV['MAIL_ADDRESS']

  def received_email(message)
    @message = message
    mail(subject: 'Medpot | 応募メール') do |format|
      format.text
    end
  end
end
