# README

Gems Needed versions: 

gem 'rails', '~> 7.0.3'

gem 'ruby' '3.0.0'

gem 'stripe', '~> 6.5'

gem 'devise'

gem 'devise_invitable', '~> 2.0.0'

gem 'rails_admin', '~> 3.0'


* Config.application: 

    require_relative 'boot'

    require 'rails/all'

    Bundler.require(*Rails.groups)

    module Project
    class Application < Rails::Application
        config.load_defaults 7.0
    end
    end

* Database creation
Post gres gem 'pg'
rails db:migrate
rails db:setup

* Check out the repository

git clone https://github.com/SohaibMao/Billing-Payment

* Start the Rails server

You can start the rails server using the command given below.

bundle install
rails s

And now you can visit the site with the URL https://booktrekker.herokuapp.com/


* Seed User Admin Account:
name      : sohaibmayo12@gmail.com
password  : Devsinc

* Other Accounts : 
name      :f180166@nu.edu.pk
name      :sohaib.mmeo@devsinc.com
pass      : Devsinc

Testing : 
command : rails spec

