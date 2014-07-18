class CreateDebitGroups < ActiveRecord::Migration
  def change
    create_table :debit_groups do |t|
      t.integer :group_id
      t.timestamps
    end
  end
end
