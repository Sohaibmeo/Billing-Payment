# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :authenticate_user!
  def index
    @plan = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    @new_feat_use = FeatureUse.new
  end
end
