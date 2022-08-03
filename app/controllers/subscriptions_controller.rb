# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @my_plan_id = params[:my_plan_id]
    @subscription_id = Stripe::Subscription.list({limit: 3, customer: current_user.customer_id }).first.id
    @subscription = Subscription.new
  end

  def create
    subscription = Subscription.new(subscription_params)
    subscription.user_id = current_user.id
    subscription.plan_id = params[:subscription][:plan_id]
    subscription.subscription_id = params[:subscription][:subscription_id]
    subscription.save
  end

  def subscription_params
    params.require(:subscription).permit(:subscription_id, :user_id, :plan_id)
  end
end
