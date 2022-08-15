class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
    authorize @transactions
  end

  def new
    transaction = Transaction.new
    StripeTransactions.new(current_user).fetch_new_transaction(transaction)
    redirect_to subscriptions_path, notice: 'Subscription and Transaction added'
  end
end
