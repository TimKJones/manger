ActiveAdmin.register Address do

  permit_params :street_address, :street_address_line_2, :city, :state, :zip, :company_id

  index do
    selectable_column
    id_column
    column :street_address
    column :street_address_line_2
    column :city
    column :state
    column :zip
    column "Company Name" do |address|
      address.company.name
    end
    actions
  end

end
