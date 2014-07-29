def company_link(company)
  link_to company, [:admin, company]
end

ActiveAdmin.register Credit do

  actions :index, :show, :edit

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

  show do
    attributes_table do
      row :company do
        company_link credit.company
      end
      row :amount do
        credit.amount
      end
      row :sent_date
      row :status
      row :created_at
    end
  end

  permit_params :status, :sent_date

  form do |f|
    f.inputs "Credit" do
      f.input :company, input_html: { disabled: true }
      f.input :amount, input_html: { disabled: true }
      f.input :created_at, input_html: { disabled: true }, as: :datepicker
      f.input :status
      f.input :sent_date, as: :datepicker
    end
    f.actions
  end

end
