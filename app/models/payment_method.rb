class PaymentMethod < ActiveRecord::Base

  belongs_to :user

  #ransacker :by_user_name, formatter: proc { |v|
  #  PaymentMethod.select do |payment_method|
  #    return nil unless payment_method.user
  #    name = "#{payment_method.user.first_name} #{payment_method.user.last_name}"
  #    if name.include? v.to_s
  #      payment_method
  #    else
  #      nil
  #    end
  #  end
  #}, splat_param: true do |parent|
  #  parent.table[:id]
  #end

end
