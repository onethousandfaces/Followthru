class CreatePledgeTypes < ActiveRecord::Migration
  def change
    create_table :pledge_types do |t|
      t.integer :project_id
      t.string :name
      t.string :desc
      t.string :image

      t.timestamps
    end
  end
end
