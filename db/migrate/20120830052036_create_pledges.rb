class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :userdatum_id
      t.integer :pledge_type_id
      t.decimal :amount

      t.timestamps
    end
  end
end
