class OverchargeController < ApplicationController
  before_action :is_admin?
  def index
    @users = User.joins(:subscriptions).group('users.id').having('count(subscriptions.id) > 0')
  end

  def create
    subscription = Subscription.find(session['subscription'])
    authorize subscription
    charge = StripeOveruse.new(subscription).over_use
    if charge.nil?
      redirect_to overcharge_index_path, alert: 'Unsuccessful Could Not Charge'
    else
      redirect_to overcharge_index_path, notice: 'Successfully Charged'
    end
  end

  private

  def is_admin?
    redirect_to plans_path, alert: 'You Are Not Authorized' unless current_user.admin?
  end
end
