class RemoveDiscIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :disc_id, :integer
  end
end
