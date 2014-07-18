class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :debit_group_id
      t.string :status
      t.date :sent_date
      t.string :delivery_method

      t.timestamps
    end
  end
end
