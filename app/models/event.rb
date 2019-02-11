class Event < ApplicationRecord
	belongs_to :admin, class_name: 'User'

	has_many :attendances
	has_many :users, through: :attendances, foreign_key: 'user_id'
	validates :start_date, presence: true, unless: :is_past?
	validates :duration, presence: true, numericality:{greater_than: 0}, if: :is_multiple_of_5?
	validates :title, presence: true, length:{in:5..140}
	validates :description, presence: true, length:{in:20..1000}
	validates :price, presence: true, numericality:{greater_than:0, less_than:1001}
	validates :location, presence:true

	def is_past?
		if start_date.present? && start_date < Date.today
			errors.add(:start_date, "Event must be in the futureuuuhkhkhkh")
		end
	end

	def is_multiple_of_5?
		unless duration.multiple_of?(5)
			self.errors[:name] << "Duration must be a multiple of 5"
		end
	end
end


