class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
