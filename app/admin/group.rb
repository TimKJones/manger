def company_link(company)
  link_to company, [:admin, company]
end

ActiveAdmin.register Group do

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

=begin
    #TODO how are users related to groups?
    panel "Users" do
      table_for group.users do
        column :first_name
        column :last_name
        column :email
      end
    end
=end
  end

end
