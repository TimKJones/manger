ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email,
    recurring_payments_attributes: [:id, :rent_amount]

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

    f.inputs "Recurring Group Payments" do
      f.template.render partial: 'recurring_payments', locals: { f: f }
    end

    f.actions
  end

  show title: proc { |user| "#{user.first_name} #{user.last_name} (#{user.email})" } do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :created_at
    end

    panel "Payment Methods" do
      table_for user.payment_methods do
        column "Payment Method" do |payment_method|
          link_to "View", [:admin, payment_method]
        end
        column "Balanced Bank Name", :balanced_bank_name
        column "Balanced Account Number", :balanced_account_number
      end
    end

    panel "Groups" do
      table_for user.groups do
        column "Group" do |group|
          link_to "View", [:admin, group]
        end
        column :street_address
        column :city
        column "Company" do |group|
          link_to group.company, [:admin, group.company]
        end
        column "Rent Amount" do |group|
          RecurringPayment.find_by_user_id_and_group_id(user.id, group.id).rent_amount
        end
      end
    end
  end

end
