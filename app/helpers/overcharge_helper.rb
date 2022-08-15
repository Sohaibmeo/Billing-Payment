module OverchargeHelper
  def feature_use_by_plan_usage(plan, usage)
    FeatureUse.where(plan_id: plan, usage_id: usage)
  end

  def subscription_by_plan_user(plan, user)
    Subscription.find_by(plan_id: plan, user_id: user) 
  end
end
