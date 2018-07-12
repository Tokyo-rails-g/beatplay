class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name
      t.string :first_name
      t.string :postal_code
      t.integer :prefecture
      t.string :city
      t.string :address1
      t.string :address2
      t.timestamps
    end
  end
end
