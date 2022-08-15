# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plan = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end
end
