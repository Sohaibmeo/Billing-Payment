# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe 'PlansController', type: :request do
  let(:demo_plan) { Plan.new(name: 'AnotherPlan', price: 20) }
  let(:demo_user) { User.new(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  context 'with no user' do
    it 'Index will redirect to login' do
      get plans_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'Show will redirect to login' do
      demo_plan.save
      get plan_path(demo_plan)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'with valid User,' do
    before do
      demo_user.save
      demo_plan.save
      sign_in demo_user
    end

    it 'Index will show plans' do
      get plans_path
      expect(response).to render_template(:index)
    end

    it 'Show plan by id' do
      get plan_path(demo_plan)
      expect(response).to render_template(:show)
    end
  end
end
