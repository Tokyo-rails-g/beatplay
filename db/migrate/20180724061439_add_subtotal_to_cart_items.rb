class AddSubtotalToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :subtotal, :integer
  end
end
