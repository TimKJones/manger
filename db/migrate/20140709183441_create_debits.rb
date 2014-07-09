class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.integer :rent_amount
      t.integer :status, default: 0
      t.integer :debit_group_id
      t.integer :user_id
      t.integer :payment_method_id
      t.string :balanced_id
      t.string :balanced_href
      t.string :balanced_transaction_number

      t.timestamps
    end
  end
end
