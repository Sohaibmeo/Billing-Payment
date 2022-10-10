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
  rescue ActiveRecord::RecordNotFound
    redirect_to subscriptions_path, notice: 'Cannot Show This One'
  end

  def new
    @my_plan_id = session['plan_id']
    @subscription = Subscription.new
    authorize @subscription
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
    subscription.destroy
    redirect_to subscriptions_path, notice: 'Succesfully Unsubscribed'
  rescue ActiveRecord::RecordNotFound
    redirect_to plans_path, notice: 'Cannot Unsubscribe What Does Not Exist'
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id, :overuse)
  end
end
