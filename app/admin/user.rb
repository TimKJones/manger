ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :created_at
    end

    table_for user.payment_methods do
      column "Payment Method" do |payment_method|
        link_to "View Payment Method", [:admin, payment_method]
      end
      column "Balanced Bank Name", :balanced_bank_name
      column "Balanced Account Number", :balanced_account_number
    end
  end

end
