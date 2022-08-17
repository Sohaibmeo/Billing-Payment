# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
    authorize @plans
  end

  def show
    @plan = Plan.find(params[:id])
    authorize @plan
  end
end
