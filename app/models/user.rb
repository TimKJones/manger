class User < ActiveRecord::Base
  has_many :payment_methods
end
