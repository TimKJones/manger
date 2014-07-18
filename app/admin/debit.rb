ActiveAdmin.register Debit do

  index do
    selectable_column
    id_column
    column "User" do |debit|
      link_to debit.user, [:admin, debit.user]
    end
    column "Group" do |debit|
      link_to debit.group, [:admin, debit.group]
    end
    #TODO enum => to_s?
    column :status
    column :created_at
  end

end
