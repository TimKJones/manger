ActiveAdmin.register Company do

  filter :name
  filter :city

  index do
    selectable_column
    id_column
    column :name
    column :city
    actions
  end

  show do
    attributes_table do
      row :name
      row :city
      row :email
      row :phone
      row :created_at
    end

    table_for company.addresses do
      column :view do |address|
        link_to "Address", [:admin, address]
      end
      column :street_address
      column :street_address_line_2
    end
  end

end
