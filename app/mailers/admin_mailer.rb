class AdminMailer < ApplicationMailer
	default from: 'tout.desk@gmail.com'
 
  def welcome_email(admin)
    @admin = admin
    @url  = "http:/localhost:3000/users/password/edit?reset_password_token=#{@admin.password_token}"
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end
end
