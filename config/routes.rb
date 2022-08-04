# frozen_string_literal: true

Rails.application.routes.draw do
  resources :subscriptions
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'about', to: 'about#index', as: :about
  resources :feature_uses
  resources :plans do
    resources :features
    resources :checkout
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
