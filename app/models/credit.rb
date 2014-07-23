class Credit < ActiveRecord::Base
  belongs_to :debit_group
  delegate :group, to: :debit_group
  delegate :company, to: :group

  def amount
    debit_group.debits.map(&:rent_amount).reduce(:+)
  end

end
