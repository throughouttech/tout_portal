class UserMailer < ApplicationMailer
	 default from: 'tout.desk@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = "http:/localhost:3000/users/password/edit?reset_password_token=#{@user.password_token}"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
