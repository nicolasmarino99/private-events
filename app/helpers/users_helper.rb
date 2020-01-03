# frozen_string_literal: true

module UsersHelper
  def attended_events
    current_user.attended_events
  end
end
