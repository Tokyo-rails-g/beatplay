class ChangeDatatypePrefOfUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :pref, :string
  end
end
