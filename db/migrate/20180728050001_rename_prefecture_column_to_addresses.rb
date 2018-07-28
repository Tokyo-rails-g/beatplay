class RenamePrefectureColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :prefecture, :pref
  end
end
