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
      link_to address.company.name, [:admin, address.company]
    end
    actions
  end

  show do
    attributes_table do
      row :street_address
      row :street_address_line_2
      row :city
      row :state
      row :zip
      row :company do |address|
        link_to address.company.name, [:admin, address.company]
      end
    end
  end

end
