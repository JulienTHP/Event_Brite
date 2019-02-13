class Attendance < ApplicationRecord
	after_create :new_attendant

  belongs_to :user #participants as clasname user
  belongs_to :event

  def new_attendant
    AttendanceMailer.new_attendant(self.event).deliver_now
  end
end