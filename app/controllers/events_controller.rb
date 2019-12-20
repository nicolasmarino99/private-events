class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      flash[:sucess] = "Succesfull event creation"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index 
    @events = Event.all
  end


    private

      def events_params
        params.require(:event).permit(:name, :date, :location,:description, :tag)
      end


end
