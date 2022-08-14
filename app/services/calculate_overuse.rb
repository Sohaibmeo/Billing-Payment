class CalculateOveruse
  def initialize(usage_to_use)
    @usage = Usage.find(usage_to_use.id)
  end

  def reset_overuse
    @usage.overuse_total = 0
  end

  def deduct_overuse(feature_use)
    units = feature_use.total_units - feature_use.feature.max_unit_limit
    @usage.overuse_total -= feature_use.feature.unit_price * units
    @usage.over_limit = false if @usage.overuse_total.zero?
    @usage.save if units.positive?
  end

  def calculate_overuse(feature_use)
    units = feature_use.total_units - feature_use.feature.max_unit_limit
    @usage.overuse_total += units * feature_use.feature.unit_price
    @usage.over_limit = true
    @usage.save
  end
end
