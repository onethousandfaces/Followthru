class AddRenameToGoals < ActiveRecord::Migration
  def change
    rename_column :goals, :pledgetype_id, :pledge_type_id  
  end
end
