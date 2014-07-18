class Debit < ActiveRecord::Base
  belongs_to :user
  belongs_to :debit_group
  delegate :group, to: :debit_group
end
