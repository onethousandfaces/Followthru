class AddAmountToPledgeType < ActiveRecord::Migration
  def change
    add_column :pledge_types, :amount, :decimal
  end
end
