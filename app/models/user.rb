# frozen_string_literal: true

# here
class User < ApplicationRecord
  has_one :usage, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions, dependent: :destroy
  after_commit :assign_customer_id, :assign_usage, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_customer_id
    customer = Stripe::Customer.create({
                                         email: email
                                       })

    self.customer_id = customer.id
    save
  end

  def assign_usage
    build_usage
  end
end
