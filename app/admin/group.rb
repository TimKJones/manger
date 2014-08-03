def company_link(company)
  link_to company, [:admin, company]
end

ActiveAdmin.register Group do

  permit_params :street_address, :city, :first_payment_date, :final_payment_date,
    :payment_address_id, :company_id,
    users_groups_attributes: [:_destroy, :user_id, :id],
    invites_attributes: [:_destroy, :id]

  index do
    selectable_column
    id_column
    column :street_address
    column :city
    column "Rent Amount" do
      "hashtag TODO"
    end
    column "Company" do |group|
      company_link group.company
    end
    column "Pay Date" do
      "hashtag TODO"
    end
    actions
  end

  show do
    attributes_table do
      row :street_address
      row :city
      row "Rent Amount" do
        "hashtag TODO"
      end
      row "Company" do
        company_link group.company
      end
      row "Pay Date" do
        "hashtag TODO"
      end
      row :first_payment_date
      row :final_payment_date
      row :invite_token do
        link_to "https://rentpay.cribspot.com/#/join/#{group.invite_token}"
      end
    end

    panel "Users" do
      table_for group.users do
        column "User" do |user|
          link_to "View", [:admin, user]
        end
        column :first_name
        column :last_name
        column :email
      end
    end

    panel "Invites" do
      table_for group.invites do
        column :email
        column :name
        column :created_at
      end
    end

    panel "Past Payments" do
      table_for group.debit_groups do
        column :amount
        column :created_at
        column "Status" do
          "#TODO"
        end
      end
    end
  end

  form do |f|
    f.inputs "Group Details" do
      f.input :street_address
      f.input :city
      f.input :payment_address
      f.input :first_payment_date, as: :datepicker
      f.input :company
    end

    f.inputs "Members" do
      f.template.render partial: 'user_membership', locals: { f: f }
    end

    f.inputs "Invites" do
      f.template.render partial: 'invites', locals: { f: f }
    end

    f.actions
  end

end
