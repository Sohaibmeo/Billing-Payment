# frozen_string_literal: true

RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.parent_controller = 'ApplicationController'
  config.authorize_with :pundit
  config.current_user_method(&:current_user)
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
