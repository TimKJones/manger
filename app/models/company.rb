class Company < ActiveRecord::Base

  has_many :addresses

  def to_s
    name
  end

end
