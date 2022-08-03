# frozen_string_literal: true
require 'stripe'

Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.STRIPE_PUBLISHABLE_KEY,
  secret_key: Rails.application.credentials.STRIPE_SECRET_KEY
}
# Rails.application.configure do
#   config.stripe.secret_key = Rails.application.credentials.STRIPE_SECRET_KEY
#   config.stripe.publishable_key = Rails.application.credentials.STRIPE_PUBLISHABLE_KEY
# end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
