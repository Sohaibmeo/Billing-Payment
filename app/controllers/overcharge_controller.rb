class OverchargeController < ApplicationController
  def index
    @users = User.all
  end

  def create
    subscription = Subscription.find(session['subscription'])
    charge = StripeOveruse.new(subscription).over_use
    if charge.nil?
      redirect_to overcharge_index_path, alert: 'Unsuccessful Could Not Charge'
    else
      redirect_to overcharge_index_path, notice: 'Successfully Charged'
    end
  end
end
