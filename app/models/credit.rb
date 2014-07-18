class Credit < ActiveRecord::Base
  belongs_to :debit_group
  belongs_to :group, through: :debit_group
  belongs_to :company, through: :group
end
