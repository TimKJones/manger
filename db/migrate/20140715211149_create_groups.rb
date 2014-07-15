class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :street_address
      t.text :payment_notes
      t.string :memo
      t.decimal :rent_amount
      t.boolean :separate_checks
      t.date :first_payment_date
      t.date :final_payment_date
      t.integer :company_id
      t.integer :payment_address_id
      t.string :city
      t.string :invite_token

      t.timestamps
    end
  end
end
