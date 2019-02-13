class ChargesController < ApplicationController
	def new
		@event = Event.find(params[:id])
	end
end
