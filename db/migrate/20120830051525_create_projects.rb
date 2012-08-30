class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :userdata_id
      t.string :name
      t.string :desc
      t.string :image

      t.timestamps
    end
  end
end
