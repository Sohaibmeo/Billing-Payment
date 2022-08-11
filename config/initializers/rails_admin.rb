RailsAdmin.config do |config|
  config.asset_source = :sprockets
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

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end
end
