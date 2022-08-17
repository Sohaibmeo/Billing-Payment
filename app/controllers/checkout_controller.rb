# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :params

  def index
    session = StripeSession.new(@plan, @user).initiate_session
    redirect_to session.url, allow_other_host: true
  end

  private

  def params
    @user = User.find_by(id: current_user.id)
    authorize @user
    @plan = Plan.find_by(id: session['plan_id'])
    authorize @plan
  end
end
