# frozen_string_literal: true

module FeatureUseHelper
  def feature_by_id(id)
    Feature.find_by(id: id)
  end
end
