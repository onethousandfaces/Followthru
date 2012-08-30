class AddObjectiveToProject < ActiveRecord::Migration
  def change
    add_column :projects, :objective, :string
    add_column :projects, :private, :boolean
  end
end
