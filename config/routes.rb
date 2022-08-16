# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: [ :index, :new ]
  get 'overcharge/index'
  get 'overcharge/create'
  resources :subscriptions, only: [ :index, :show, :new, :create, :destroy ]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :skip => [:registrations]
  resources :feature_uses, only: [ :index, :create, :destroy ]
  resources :plans, only: [:index, :show] do
    resources :checkout, only: :index
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
