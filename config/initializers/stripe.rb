# frozen_string_literal: true

Rails.application.configure do
  config.stripe.secret_key = Rails.application.credentials.STRIPE_SECRET_KEY
  config.stripe.publishable_key = Rails.application.credentials.STRIPE_PUBLISHABLE_KEY
end

# Stripe.api_key = "sk_test_51LFJP5KkpqXslIQH7NMdUDWB46AReuHeHVzcpXraaOu6fGmyNvoxqJ5DOwbunhkzQ59ZTKngAbSRLhsYYmDzg8BO00yCU9lZPf"
Stripe.api_key = Rails.configuration.stripe[:secret_key]
