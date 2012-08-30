class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :project_id
      t.integer :pledgetype_id
      t.decimal :total

      t.timestamps
    end
  end
end
