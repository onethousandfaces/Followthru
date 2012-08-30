class AddUserdatumToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :userdatum_id, :integer
  end
end
