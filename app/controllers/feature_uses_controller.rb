# frozen_string_literal: true

class FeatureUsesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @feature_use = FeatureUse.where(usage_id: current_user.usage.id)
    @usage = Usage.find_by(id: current_user.usage.id)
  end
  
  def create
    feature_use = FeatureUse.new(feature_use_params)
    feature_use.total_units = params[:feature_use][:total_units]
    feature_use.feature_id = params[:feature_use][:feature_id]
    feature_use.plan_id = params[:feature_use][:plan_id]
    user = current_user.usage
    feature_use.usage_id = user.id
    if feature_use.save
      calculate_overuse(feature_use)
    else
      flash.now[:error] = 'Could Not Save'
    end
  end

  def destroy
    @feature_use = FeatureUse.find(params[:id])
    if @feature_use.destroy
      flash.now[:success] = 'Succesfully Deleted'
      amount = @feature_use.total_units - @feature_use.feature.max_unit_limit
      deduct_overuse(@feature_use) if amount.positive?
    else
      flash.now[:error] = 'Could Not Delete'
    end
  end

  private

  def deduct_overuse(feature_use)
    usage = current_user.usage
    total = usage.overuse_total - feature_use.feature.unit_price
    u = Usage.find(usage.id)
    u.overuse_total = total
    if u.overuse_total.negative?
      u.over_limit = false
    end
    u.save
  end

  def feature_use_params
    params.require(:feature_use).permit(:total_units, :feature_id, :usage_id, :plan_id)
  end

  def calculate_overuse(feature_use)
    a = feature_use.total_units - feature_use.feature.max_unit_limit
    if a.positive?
      usage = current_user.usage
      total = usage.overuse_total
      total += a * feature_use.feature.unit_price
      u = Usage.find(usage.id)
      u.overuse_total = total
      u.over_limit = true
      u.save
    end
  end
end
