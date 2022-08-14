# frozen_string_literal: true

module SubscriptionHelper
  def item_price(items)
    items.data[0].price.unit_amount / 100
  end

  def time_zone(time)
    Time.zone.at(time)
  end
end
