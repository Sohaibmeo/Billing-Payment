# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscription = Subscription.where(user_id: current_user.id)
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
    authorize @subscription
    @sub = StripeSubscription.new(@subscription).retreive_subscription
  end

  def new
    @my_plan_id = params[:my_plan_id]
    @subscription_id = StripeSubscription.new(current_user.customer_id).recent_subscription
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    subscription = Subscription.new(subscription_params)
    authorize subscription
    if subscription.save
      redirect_to subscriptions_path, notice: 'Subscribed successfully'
    else
      redirect_to plans_path, alert: 'Subscription Interrupted'
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    plan = subscription.plan_id
    if subscription.destroy
      FeatureUse.where(plan_id: plan).destroy_all
      subscribed = StripeSubscription.new(subscription).retreive_subscription
      StripeSubscription.new(subscribed).delete_subscription
      redirect_to subscriptions_path, notice: 'Succesfully Unsubscribed'
    else
      redirect_to subscriptions_path, alert: 'Could Not Unsubscribe'
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:subscription_id, :user_id, :plan_id, :overuse)
  end
end
