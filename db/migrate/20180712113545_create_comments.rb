class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :admin_id
      t.integer :contact_id
      t.text :response
      t.timestamps
    end
  end
end
