class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :user_id
      t.string :balanced_bank_name
      t.string :balanced_account_number

      t.timestamps
    end
  end
end
