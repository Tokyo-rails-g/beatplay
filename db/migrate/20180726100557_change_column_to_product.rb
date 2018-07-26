class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :favorite_count, :integer, default: 0
  end
end
