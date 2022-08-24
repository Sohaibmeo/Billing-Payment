# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe 'SubscriptionsController', type: :request do
  let(:plan) { create(:plan) }
  let(:user) { create(:user) }
  let(:subscription) { create(:subscription, plan_id: plan.id, user_id: user.id) }

  context 'with no user' do
    it 'redirects to login session instead of #index' do
      get subscriptions_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects to login session instead of #show' do
      get subscription_path(subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'responds with unauthorized no user session' do
      get new_subscription_path(subscription)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'redirects to login session instead of #destroy' do
      delete subscription_path(subscription)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects to login session instead of #create' do
      params = { subscription: { plan: plan, user: user, overuse: 0 } }
      post subscriptions_path(params)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'with valid User,' do
    before do
      sign_in user
    end

    it 'renders index template' do
      get subscriptions_path
      expect(response).to render_template(:index)
    end

    it 'renders show based on user subscription' do
      get subscription_path(subscription)
      expect(response).to render_template(:show)
    end

    it 'redirects to subscription path for wrong subscription' do
      get subscription_path(2)
      expect(response).to redirect_to(subscriptions_path)
    end

    it 'is successful generating a new subsription path' do
      get new_subscription_path
      expect(response).to be_successful
    end

    context 'with subscription deletion' do
      it 'redirects to subscription path' do
        delete subscription_path(subscription)
        expect(response).to redirect_to(subscriptions_path)
      end

      it 'redirects to plans_path for a wrongful deletion attempt' do
        delete subscription_path(2)
        expect(response).to redirect_to(plans_path)
      end
    end

    context 'with subscription creation' do
      it 'redirects to new_transaction_path' do
        params = { subscription: { user_id: user.id, plan_id: plan.id, overuse: 0 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(new_transaction_path)
      end

      it 'redirects to plans_path for wrong params' do
        params = { subscription: { user_id: user.id, plan_id: plan.id, overuse: -1 } }
        post subscriptions_path(params)
        expect(response).to redirect_to(plans_path)
      end
    end
  end
end
