module PlansHelper
  def subscribed(plan)
    subscriptions = Subscription.where(id: current_user.subscription_ids)
    return subscriptions.find_by(plan_id: plan) unless nil?
  end

  def feature(plan)
    plan.features
  end

  def feature_use(plan, feature)
    usage = usage()
    return FeatureUse.find_by(usage_id: usage.id, feature_id: feature, plan_id: plan) unless nil?
  end
end
