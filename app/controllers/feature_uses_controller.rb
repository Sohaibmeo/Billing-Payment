# frozen_string_literal: true

class FeatureUsesController < ApplicationController
  before_action :authenticate_user!

  def index
    @feature_use = FeatureUse.where(usage_id: current_user.usage.id)
  end

  def create
    feature_use = FeatureUse.new(new_feature_use_params)
    if feature_use.save
      CalculateOveruse.new(current_user.usage).calculate_overuse(feature_use)
    else
      redirect_to request.referer, alert: 'Delete Previous Entries To Make A New Plan'
    end
  end

  def destroy
    feature_use = FeatureUse.find(params[:id])
    if feature_use.destroy
      CalculateOveruse.new(current_user.usage).deduct_overuse(feature_use)
      redirect_to request.referer, notice: 'Successfully Deleted'
    else
      redirect_to request.referer, alert: 'Could Not Delete'
    end
  end

  private

  def new_feature_use_params
    params.require(:feature_use).permit(:total_units, :feature_id, :usage_id, :plan_id)
  end
end
