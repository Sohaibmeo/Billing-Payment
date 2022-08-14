# frozen_string_literal: true

module ApplicationHelper
  def usage
    Usage.find_by(user_id: current_user.id)
  end

  def plan_by_id(id)
    Plan.find_by(id: id)
  end
end
