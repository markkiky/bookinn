class CustomerMailer < ApplicationMailer
    default from: "markkaris438@gmail.com"

    def welcome_email
        @user = params[:customer]
        @url = "http://facebook.com"
        mail(to: @user.email, subject: "Welcome to bookinn")
    end

    def mpesa_payment_email
        # byebug
        attachments['payment_confirmation'] = _layout 'mpesa_payment_email', "mpesa_payment_email"
        mail(to: "markkaris438@gmail.com", subject: "Booking Payment Confirmation")
    end
end
