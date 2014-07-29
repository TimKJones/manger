class DebitGroup < ActiveRecord::Base
  belongs_to :group
  has_many :debits

  def amount
    debits.map(&:rent_amount).reduce(:+)
  end
end
