# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def show
    @plan = Plan.find(params[:plan_id])
    @feature = Feature.find(params[:id])
  end

  def create
    @feature = Feature.new
  end
end
