# frozen_string_literal: true

class CheckoutController < ApplicationController
  def index
    user = User.find_by(id: current_user.id)
    plan_id = session['plan_id']
    plan = Plan.find_by(id: plan_id)
    success_url = new_subscription_url
    @session = InitiateSession.new(plan, user, success_url).initiate_session
  end
end
