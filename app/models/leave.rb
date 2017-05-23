class Leave < ApplicationRecord
  belongs_to :user
  belongs_to :leave_type
  validate :date_cannot_be_in_the_past
  validates :user_id, :start_at, :end_at, :leave_type_id, :description, presence: true

  after_create :send_admin_mail 

  def date_cannot_be_in_the_past
  	if start_at > end_at
  		errors.add(:end_at, "can't be in the past")
  	end
    if  start_at < Date.today 
      errors.add(:start_at, "can't be in the past")
    end
    if  end_at < Date.today
    	errors.add(:end_at, "can't be in the past")
    end
  end  

  def send_admin_mail
    AdminMailer.leave_mail(user).deliver
  end
  
end
