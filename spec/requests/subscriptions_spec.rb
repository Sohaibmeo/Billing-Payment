# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe 'SubscriptionsController', type: :request do
  let(:demo_plan) { Plan.create(name: 'AnotherPlan', price: 20) }
  let(:demo_user) { User.create(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }
  let(:demo_subscription) { Subscription.create(plan: demo_plan, user: demo_user, overuse: 0) }

  context 'with no user' do
    it 'Index will redirect to login' do
      get subscriptions_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'Show will redirect to login' do
      get subscription_path(demo_subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'New will respond with unauthorized' do
      get new_subscription_path(demo_subscription)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Destroy will redirect to login' do
      delete subscription_path(demo_subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'create  will redirect to login' do
      params = { subscription: { plan: demo_plan, user: demo_user, overuse: 0 } }
      post subscriptions_path(params)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'with valid User,' do
    before do
      sign_in demo_user
    end

    it 'Index will show subscriptions' do
      get subscriptions_path
      expect(response).to render_template(:index)
    end

    it 'Show subscription by id' do
      get subscription_path(demo_subscription)
      expect(response).to render_template(:show)
    end

    it 'new subscription by id' do
      get new_subscription_path
      expect(response).to be_successful
    end

    context 'when destroying subscription,' do
      it 'contains valid subscription belonging to user' do
        delete subscription_path(demo_subscription)
        expect(response).to redirect_to(subscriptions_path)
      end

      it 'contains invalid subscription belonging to user' do
        delete subscription_path(2)
        expect(response).to redirect_to(subscriptions_path)
      end
    end

    context 'when creating subscription,' do
      it 'contains valid attritbutes' do
        params = { subscription: { user_id: demo_user.id, plan_id: demo_plan.id, overuse: 0 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(new_transaction_path)
      end

      it 'contains invalid attritbutes' do
        params = { subscription: { user_id: demo_user.id, plan_id: demo_plan.id, overuse: -1 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(plans_path)
      end
    end
  end
end
