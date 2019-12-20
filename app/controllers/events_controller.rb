class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.valid?
      @event.save
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

      def logged_in_user
        flash[:danger] = "You must sign in first"
        redirect_to login_path
      end


end
