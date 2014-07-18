def user_link(user)
  link_to user, [:admin, user]
end

def group_link(group)
  link_to group, [:admin, group]
end

def payment_method_link(payment_method)
  link_to payment_method.balanced_account_number, [:admin, payment_method]
end

ActiveAdmin.register Debit do

  actions :index, :show

  config.batch_actions = false

  index do
    selectable_column
    id_column
    column "User" do |debit|
      user_link debit.user
    end
    column "Group" do |debit|
      group_link debit.group
    end
    #TODO enum => to_s?
    column :status
    column :created_at
    actions
  end

  show do
    attributes_table do
      row "User" do
        user_link debit.user
      end
      row "Group" do
        group_link debit.group
      end
      row "Payment Method" do
        payment_method_link debit.payment_method
      end
    end
  end

end
