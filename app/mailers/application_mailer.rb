# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.MAILER_EMAIL
  layout 'mailer'
end
