class ChangeColumnToOrder2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :payment, :integer, default: 0, null: false, limit: 1
  end
end
