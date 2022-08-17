# frozen_string_literal: true

module OverchargeHelper
  def feature_use_by_plan_usage(plan, usage)
    FeatureUse.where(plan_id: plan, usage_id: usage)
  end

  def subscription_by_plan_user(plan, user)
    Subscription.find_by(plan_id: plan, user_id: user)
  end

  def calculate_units(feature_use, subscription)
    units = feature_use.total_units - feature_use.feature.max_unit_limit
    subscription.overuse += units * feature_use.feature.unit_price if units.positive?
  end
end
