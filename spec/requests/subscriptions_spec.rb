# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe 'SubscriptionsController', type: :request do
  let(:plan) { create(:plan) }
  let(:user) { create(:user) }
  let(:subscription) { create(:subscription, plan_id: plan.id, user_id: user.id) }

  context 'with no user' do
    it 'Index will redirect to login' do
      get subscriptions_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'Show will redirect to login' do
      get subscription_path(subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'New will respond with unauthorized' do
      get new_subscription_path(subscription)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Destroy will redirect to login' do
      delete subscription_path(subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'create  will redirect to login' do
      params = { subscription: { plan: plan, user: user, overuse: 0 } }
      post subscriptions_path(params)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'with valid User,' do
    before do
      sign_in user
    end

    it 'Index will show subscriptions' do
      get subscriptions_path
      expect(response).to render_template(:index)
    end

    it 'Show subscription by id' do
      get subscription_path(subscription)
      expect(response).to render_template(:show)
    end

    it 'new subscription by id' do
      get new_subscription_path
      expect(response).to be_successful
    end

    context 'when destroying subscription,' do
      it 'contains valid subscription belonging to user' do
        delete subscription_path(subscription)
        expect(response).to redirect_to(subscriptions_path)
      end

      it 'contains invalid subscription belonging to user' do
        delete subscription_path(2)
        expect(response).to redirect_to(subscriptions_path)
      end
    end

    context 'when creating subscription,' do
      it 'contains valid attritbutes' do
        params = { subscription: { user_id: user.id, plan_id: plan.id, overuse: 0 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(new_transaction_path)
      end

      it 'contains invalid attritbutes' do
        params = { subscription: { user_id: user.id, plan_id: plan.id, overuse: -1 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(plans_path)
      end
    end
  end
end
