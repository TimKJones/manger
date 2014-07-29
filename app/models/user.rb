class User < ActiveRecord::Base
  has_many :payment_methods
  has_many :users_groups
  has_many :groups, through: :users_groups

  def to_s
    "#{first_name} #{last_name}"
  end
end
