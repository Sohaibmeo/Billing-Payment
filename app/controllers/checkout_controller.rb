# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :fetch_values

  def index
    @session = StripeSession.new(@plan, @user).initiate_session
  end

  private

  def fetch_values
    @user = User.find_by(id: current_user.id)
    authorize @user
    @plan = Plan.find_by(id: session['plan_id'])
    authorize @plan
  end
end
