# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plan = Plan.all
    authorize @plan
  end

  def show
    @plan = Plan.find(params[:id])
    authorize @plan
  end
end
