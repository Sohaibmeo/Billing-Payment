# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :info, :error, :warning, :success

  private

  # def user_not_authorized
  #   redirect_to plans_url, alert: 'You Are Not Authorized'
  # end

  def after_sign_in_path_for(_resource_or_scope)
    plans_path
  end
end
