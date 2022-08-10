# frozen_string_literal: true

class PlansController < ApplicationController
  add_flash_types :info, :error, :warning, :success
  before_action :authenticate_user!
  def index
    @plan = Plan.all
    @subscriptions = Subscription.where(id: current_user.subscription_ids)
  end

  def show
    @plan = Plan.find(params[:id])
    @feature = @plan.features
    @new_feat_use = FeatureUse.new
    @usage = current_user.usage
  end
end
