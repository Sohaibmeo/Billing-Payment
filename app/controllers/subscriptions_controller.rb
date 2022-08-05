# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscription = Subscription.where(user_id: current_user.id)
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
    @plan = Plan.find_by(id: @subscription.plan_id)
    @sub = Stripe::Subscription.retrieve(
      @subscription.subscription_id
    )
    @time_start = Time.at(@sub.billing_cycle_anchor)
    @time_recycle = Time.at(@sub.current_period_end)
  end

  def new 
    @my_plan_id = params[:my_plan_id]
    @subscription_id = Stripe::Subscription.list({ customer: current_user.customer_id }).first.id
    @subscription = Subscription.new
  end
  
  def create
    subscription = Subscription.new(subscription_params)
    subscription.user_id = current_user.id
    subscription.plan_id = params[:subscription][:plan_id]
    subscription.subscription_id = params[:subscription][:subscription_id]
    subscription.save
    redirect_to plans_path
  end
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash.now[:success] = 'Succesfully Deleted'
    subscription_del_from_stripe(@subscription.subscription_id)
    redirect_to subscriptions_path
  end

  private 
  
  def subscription_params
    params.require(:subscription).permit(:subscription_id, :user_id, :plan_id)
  end
  def subscription_del_from_stripe(subs)
    @sub = Stripe::Subscription.retrieve(
      subs
    )
    Stripe::Subscription.delete(
      @sub.id
    )
  end
end
