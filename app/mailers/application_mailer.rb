# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'sohaib.mmeo@devsinc.com'
  layout 'mailer'
end
