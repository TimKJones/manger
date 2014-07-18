class Group < ActiveRecord::Base
  has_many :users
  belongs_to :payment_address, class_name: "Address"
  belongs_to :company
end
