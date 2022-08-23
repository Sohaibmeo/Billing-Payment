# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :info, :error, :warning, :success

  private

  def user_not_authorized
    redirect_back fallback_location: '/', alert: 'You Are Not Authorized'
  end

  def after_sign_in_path_for(_resource_or_scope)
    plans_path
  end

  def after_invite_path_for(_resource)
    plans_path
  end
end
