# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'https://booktrekker.herokuapp.com'
  resources :transactions, only: %i[index new]
  get 'overcharge/index'
  get 'overcharge/create'
  resources :subscriptions, only: %i[index show new create destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: [:registrations]
  resources :feature_uses, only: %i[index create destroy]
  resources :plans, only: %i[index show] do
    resources :checkout, only: :index
  end

  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: %i[index show]
      resources :plans, only: %i[index show]
    end
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
