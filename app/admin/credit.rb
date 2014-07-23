def company_link(company)
  link_to company, [:admin, company]
end

ActiveAdmin.register Credit do

  actions :index, :show

  index do
    selectable_column
    id_column
    column "Company" do |credit|
      company_link credit.company
    end
    column "Amount" do |credit|
      credit.amount
    end
    column :sent_date
    column :status
    column :created_at
    actions
  end

end
