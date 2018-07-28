class ChangeDatatypePrefOfAddresses < ActiveRecord::Migration[5.2]
  def change
  	change_column :addresses, :pref, :string
  end
end
