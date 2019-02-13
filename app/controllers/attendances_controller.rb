class AttendancesController < ApplicationController
	before_action :set_event, only: [:new, :create, :index]
	before_action :is_not_your_event, only: [:index]

	def set_event
		@event = Event.find(params[:event_id])
  	@amount = @event.price * 100
	end

  def is_not_your_event
    unless @event.admin == current_user
      flash[:danger] = 'Back off ! Not your event !'
      redirect_to root_path
    end
  end

  def index
  end

  def new
  	p '33333333333333'
  	p params
  	@attendance = Attendance.new
  	@usersattandances = @event.attendances.map {|attendance| attendance.user }
  end

  def create
  	
	  	customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'eur'
		  )
		@attendance = Attendance.new(user: current_user, event: @event)
		@attendance.stripe_customer_id = charge.customer

		if @attendance.save!
			flash[:success] = 'Reservation reussie !'
			# redirect_to event_path(@event.id)
		else
			flash[:error] = 'Erreur lors de la reservation'
			p @attendance.errors
			render :new
		end
		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
end
end



