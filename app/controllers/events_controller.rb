class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :attend]
  
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
      @event.attendees.push(current_user)
      redirect_to @event
    else
      render 'new'
    end
  end

  def index 
    @events = Event.all
  end

  def attend 
    @event = Event.find(params[:id])
    @attendance = Attendance.new(attendee: current_user, attended_event: @event)
    if @attendance.save
      redirect_to current_user
    else
      render 'index'
    end
  end

  private

      def events_params
        params.require(:event).permit(:name, :date, :location, :description, :tag, :event_picture)
      end

      def logged_in_user
        flash[:danger] = "You must sign in first" unless logged_in?
        redirect_to login_path unless logged_in?
      end


end
