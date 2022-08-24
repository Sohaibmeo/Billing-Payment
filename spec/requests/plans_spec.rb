# # frozen_string_literal: true

# require 'rails_helper'
# require 'simplecov'
# SimpleCov.start

# RSpec.describe 'PlansController', type: :request do
#   let(:plan) { build(:plan) }
#   let(:user) { build(:user) }

#   context 'with no user' do
#     it 'Index will redirect to login' do
#       get plans_path
#       expect(response).to redirect_to(new_user_session_path)
#     end

#     it 'Show will redirect to login' do
#       plan.save
#       get plan_path(plan)
#       expect(response).to redirect_to(new_user_session_path)
#     end
#   end

#   context 'with valid User,' do
#     before do
#       user.save
#       plan.save
#       sign_in user
#     end

#     it 'Index will show plans' do
#       get plans_path
#       expect(response).to render_template(:index)
#     end

#     it 'Show plan by id' do
#       get plan_path(plan)
#       expect(response).to render_template(:show)
#     end
#   end
# end
