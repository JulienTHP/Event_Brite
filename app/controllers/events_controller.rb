class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def new
    @event = Event.new
  end

  def create
    p '#############'
    p params

    post_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)

    @event = Event.new(post_params)
    @event.admin = current_user

    if @event.save
      flash.now[:success] = "Your event have been sucessfuly created! Thanks for your trust"
      redirect_to event_path(@event.id)
    else
      render new_event_path
    end
  end

  def destroy
  end
end