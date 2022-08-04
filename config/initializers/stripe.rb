# frozen_string_literal: true
require 'stripe'

Rails.configuration.stripe = {
  publishable_key: "pk_test_51LFJP5KkpqXslIQHDL6hqnCmyvxcCndR005R3dd6GHx9yPrnrbCcISQccz70dfFW46mF1mj70lRhK88loCwdHjxK00TwR9zOpw",
  secret_key: "sk_test_51LFJP5KkpqXslIQH7NMdUDWB46AReuHeHVzcpXraaOu6fGmyNvoxqJ5DOwbunhkzQ59ZTKngAbSRLhsYYmDzg8BO00yCU9lZPf"
}
# Rails.application.configure do
#   config.stripe.secret_key = Rails.application.credentials.STRIPE_SECRET_KEY
#   config.stripe.publishable_key = Rails.application.credentials.STRIPE_PUBLISHABLE_KEY
# end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
