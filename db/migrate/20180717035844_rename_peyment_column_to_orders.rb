class RenamePeymentColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :peyment, :payment
  end
end
