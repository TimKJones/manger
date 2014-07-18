class DebitGroup < ActiveRecord::Base
  belongs_to :group
  has_many :debits
end
