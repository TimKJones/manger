class User < ActiveRecord::Base
  has_many :payment_methods
  belongs_to :group

  def to_s
    "#{first_name} #{last_name}"
  end
end
