class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :album_title
      t.string :artist
      t.integer :disc_id
      t.string :label
      t.integer :category_id
      t.integer :favorite_count
      t.string :image_url
      t.integer :price
      t.integer :stock
      t.integer :release_year

      t.timestamps
    end
  end
end
