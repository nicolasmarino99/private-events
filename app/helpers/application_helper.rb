module ApplicationHelper
  def flash_class(level)
    if level == "success"
        "ui green message"
    elsif level == "error"
        "ui red message"
    else 
        "ui blue message"
    end
  end
  def show_all_events
    @all_events = current_user.events.pluck(:id)
  end
end
