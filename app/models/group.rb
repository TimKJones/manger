class Group < ActiveRecord::Base
  has_many :users_groups
  has_many :users, through: :users_groups
  has_many :invites
  has_many :debit_groups
  belongs_to :payment_address, class_name: "Address"
  belongs_to :company

  accepts_nested_attributes_for :users_groups, allow_destroy: true, reject_if: proc { |attributes| attributes[:user_id].blank? }

  def to_s
    "#{street_address}, #{city}"
  end
end
