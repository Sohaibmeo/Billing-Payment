# frozen_string_literal: true

class Api::V1::SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.where(user_id: 1)
    render json: @subscriptions
  end

  def show
    @subscription = Subscription.find(params[:id])
    render json: @subscription
  rescue ActiveRecord::RecordNotFound
    redirect_to subscriptions_path, notice: 'Cannot Show This One'
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id, :overuse)
  end
end
