class AttendancesController < ApplicationController
	#before_action :set_event, only: [:new, :create, :index]
	#before_action :is_not_your_event, only: [:index]


	def index
	end

	def new
		@event = Event.find(params[:event_id])
		attendance = Attendance.new
		@userattendance = @event.attendances.map { |attendance| attendance.user  }
	end

	def create
  # Amount in cents
  @amount = @event.price * 100

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  @attendance = Attendance.new(user: current_user, event:@event)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
