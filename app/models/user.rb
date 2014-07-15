class User < ActiveRecord::Base
  has_many :payment_methods
  belongs_to :group
end
