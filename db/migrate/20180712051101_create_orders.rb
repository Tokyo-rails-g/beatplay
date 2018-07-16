class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :total
      t.integer :payment
      t.integer :status

      t.timestamps
    end
  end
end
