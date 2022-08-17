# frozen_string_literal: true

class FeatureUsesController < ApplicationController
  def index
    @feature_use = FeatureUse.where(usage_id: current_user.usage.id)
    authorize @feature_use
  end

  def create
    feature_use = FeatureUse.new(new_feature_use_params)
    authorize feature_use
    feature_use.save
  end

  private

  def new_feature_use_params
    params.require(:feature_use).permit(:total_units, :feature_id, :usage_id, :plan_id)
  end
end
