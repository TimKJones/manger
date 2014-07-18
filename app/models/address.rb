class Address < ActiveRecord::Base

  belongs_to :company

  has_many :groups

end
