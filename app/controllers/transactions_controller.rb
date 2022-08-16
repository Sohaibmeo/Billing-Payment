class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
    authorize @transactions
  end

  def new
    transaction = Transaction.new
    new_data = StripeTransactions.new(current_user).fetch_new_transaction(transaction)
    if new_data.nil?
      redirect_to subscriptions_path, notice: 'Could Not Create Transaction'
    else
      redirect_to subscriptions_path, notice: 'Transaction done successfully'
    end
  end
end
