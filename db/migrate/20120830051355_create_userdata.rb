class CreateUserdata < ActiveRecord::Migration
  def change
    create_table :userdata do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
