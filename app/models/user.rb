class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_admin_mail 
  has_many :leaves

  attr_accessor :password_token

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end

  def name
    (first_name.blank? && last_name.blank?) ? "NA" : "#{first_name} #{last_name}"
  end
end
