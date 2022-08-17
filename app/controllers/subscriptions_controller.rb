# frozen_string_literal: true

class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.where(user_id: current_user.id)
    authorize @subscriptions
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
    authorize @subscription
    @stripe_subscription = StripeSubscription.new(@subscription.subscription_id).retreive_subscription
  end

  def new
    @my_plan_id = session['plan_id']
    new_stripe_subscription
  end

  def create
    subscription = Subscription.new(subscription_params)
    authorize subscription
    if subscription.save
      redirect_to new_transaction_path, notice: 'Subscribed successfully'
    else
      redirect_to plans_path, alert: 'Subscription Interrupted'
    end
  end

  def destroy
    subscription = current_user.subscriptions.find(params[:id])
    authorize subscription
    if subscription.destroy
      delete_stripe_subscription(subscription)
      redirect_to subscriptions_path, notice: 'Succesfully Unsubscribed'
    else
      redirect_to subscriptions_path, alert: 'Could Not Unsubscribe'
    end
  end

  private

  def delete_stripe_subscription(subscription)
    plan = subscription.plan_id
    FeatureUse.where(plan_id: plan, usage_id: current_user.usage.id).destroy_all
    subscribed = StripeSubscription.new(subscription.subscription_id).retreive_subscription
    StripeSubscription.new(subscribed).delete_subscription
  end

  def new_stripe_subscription
    @subscription = Subscription.new
    authorize @subscription
    @subscription_id = StripeSubscription.new(current_user.customer_id).recent_subscription
    stripe_subscription = StripeSubscription.new(@subscription_id).retreive_subscription
    @date_end = stripe_subscription.current_period_end
  end

  def subscription_params
    params.require(:subscription).permit(:subscription_id, :user_id, :plan_id, :overuse, :date_end)
  end
end
