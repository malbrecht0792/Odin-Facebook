class UserMailer < ApplicationMailer
	default from: 'odinfacebooknotifications@example.com'
 
	def sign_up_confirmation_email(user)
		@user = user
		mail(to: user.email, subject: 'Odin Facebook Signup Confirmation')
	end
end
