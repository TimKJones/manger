class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :street_address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :company_id

      t.timestamps
    end
  end
end
