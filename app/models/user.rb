class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_admin_mail 

  attr_accessor :password_token

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
end
