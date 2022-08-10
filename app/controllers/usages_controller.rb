# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :authenticate_user!
  def create
    usage = Usages.new(usage_params)
    usage.user_id = current_user.id
    usage.save
  end

  private

  def usage_params
    params.require(:usage).permit(:user_id)
  end
end
