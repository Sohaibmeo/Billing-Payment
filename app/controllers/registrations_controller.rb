# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(_resource)
    plans_path
  end
end
