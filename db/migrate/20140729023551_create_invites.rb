class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.decimal :rent
      t.integer :group_id
      t.string :name

      t.timestamps
    end
  end
end
