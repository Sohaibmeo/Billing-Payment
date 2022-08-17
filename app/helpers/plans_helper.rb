# frozen_string_literal: true

module PlansHelper
  def subscribed(plan)
    subscriptions = Subscription.where(id: current_user.subscription_ids)
    return subscriptions.find_by(plan_id: plan) unless nil?
  end

  def new_feature_use(plan, feature)
    feature_use = FeatureUse.new
    feature_use.total_units = 0
    feature_use.usage_id = current_user.usage.id
    feature_use.plan_id = plan
    feature_use.feature_id = feature
    begin
      feature_use.save!
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug e.record.errors.each
    end
  end

  def feature(plan)
    plan.features
  end

  def feature_use(plan, feature)
    return FeatureUse.find_by(usage_id: current_user.usage.id, feature_id: feature, plan_id: plan) unless nil?
  end
end
