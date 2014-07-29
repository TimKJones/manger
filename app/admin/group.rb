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

end
