# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join('app/services')
  end
end
