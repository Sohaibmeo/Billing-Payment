# frozen_string_literal: true

class StripeTransactions
  def initialize(user_to_use)
    @user = user_to_use
  end

  def fetch_new_transaction(transaction)
    payment = Stripe::Invoice.list(customer: @user.customer_id).first
    transaction.description = payment.lines.data[0].description
    transaction.billing_cycle = payment.created
    transaction.amount = payment.amount_paid / 100
    transaction.hosted_invoice_url = payment.hosted_invoice_url
    transaction.invoice_pdf = payment.invoice_pdf
    transaction.user_id = @user.id
    begin
      transaction.save!
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug e.record.errors
    end
  end
end
