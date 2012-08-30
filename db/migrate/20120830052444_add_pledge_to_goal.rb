class AddPledgeToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :instances, :integer
  end
end
