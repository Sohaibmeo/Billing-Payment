class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def new
    StripeTransactions.new(current_user).fetch_new_transaction
    redirect_to subscriptions_path, notice: 'Subscription and Transaction added'
  end
end
