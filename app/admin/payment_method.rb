def user_link user
  link_to user, [:admin, user]
end

ActiveAdmin.register PaymentMethod do

  actions :all, :except => [:edit]

  filter :balanced_bank_name
  filter :balanced_account_number

  index do
    selectable_column
    id_column
    column "Name" do |payment_method|
      user_link payment_method.user
    end
    column :balanced_bank_name
    column :balanced_account_number
    actions
  end

  show do
    attributes_table do
      row "Name" do |payment_method|
        user_link payment_method.user
      end
      row :balanced_bank_name
      row :balanced_account_number
    end
  end

end
