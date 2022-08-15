class StripeTransactions
    def initialize(user_to_use)
      @user = user_to_use
    end
  
    def fetch_new_transaction
      payment = Stripe::Invoice.list(customer: @user.customer_id).first
      transaction = Transaction.new
      transaction.description = payment.lines.data[0].description
      transaction.billing_cycle = payment.created
      transaction.amount = payment.amount_paid / 100
      transaction.hosted_invoice_url = payment.hosted_invoice_url
      transaction.invoice_pdf = payment.invoice_pdf
      transaction.user_id = @user.id
      transaction.save
    end
  end