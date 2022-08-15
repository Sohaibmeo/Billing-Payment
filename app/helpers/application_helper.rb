# frozen_string_literal: true

module ApplicationHelper
  def usage
    Usage.find_by(user_id: current_user.id)
  end

  def plan_by_id(id)
    Plan.find_by(id: id)
  end

  def time_date(time)
    DateTime.strptime(Time.zone.at(time).utc.to_i.to_s, '%s').strftime('%d %m %y')
  end

  def time_zone(time)
    Time.zone.at(time)
  end
end
