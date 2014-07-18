ActiveAdmin.register Company do

  permit_params :name, :city, :email, :phone

  filter :name
  filter :city

  index do
    selectable_column
    id_column
    column :name
    column :city
    actions
  end

  form do |f|
    f.inputs "Company Details" do
      f.input :name
      f.input :city
      f.input :email
      f.input :phone
    end
    f.actions
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
