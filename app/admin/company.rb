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

end
