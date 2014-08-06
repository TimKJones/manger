class User < ActiveRecord::Base
  has_many :payment_methods
  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :recurring_payments

  accepts_nested_attributes_for :recurring_payments

  def to_s
    "#{first_name} #{last_name}"
  end
end
