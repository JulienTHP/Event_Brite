class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
	#after_create :welcome_send

  has_one_attached :avatar
	has_many :attendances, dependent: :destroy
	has_many :events, through: :attendances
	has_many :events, foreign_key: 'admin_id', dependent: :destroy
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end
end