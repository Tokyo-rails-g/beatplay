class RemovePeymentFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :peyment, :integer
  end
end
