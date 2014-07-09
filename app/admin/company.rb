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
  end

end
