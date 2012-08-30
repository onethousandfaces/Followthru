class AddDataumToPledgeType < ActiveRecord::Migration
  def change
    add_column :pledge_types, :userdatum_id, :integer
  end
end
