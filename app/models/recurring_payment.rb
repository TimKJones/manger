class RecurringPayment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :payment_method
end
