class CreateRecurringPayments < ActiveRecord::Migration
  def change
    create_table :recurring_payments do |t|
      t.decimal :rent_amount
      t.string :memo
      t.integer :user_id
      t.integer :group_id
      t.integer :payment_method_id

      t.timestamps
    end
  end
end
