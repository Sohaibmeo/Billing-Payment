# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :authenticate_user!
  def index
    plan = Plan.find(params[:plan_id])
    user = User.find_by(id: current_user.id)
    success_url = new_subscription_url(my_plan_id: plan.id)
    @session = InitiateSession.new(plan, user, success_url).initiate_session
  end
end
