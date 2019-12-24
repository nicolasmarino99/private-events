class StaticPagesController < ApplicationController
  def home
    @events = Event.all
  end

  def organize
  end

  def help
  end

  def create_event
  end
end
