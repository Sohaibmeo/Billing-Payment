# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @plan = Plan.all
  end
end
