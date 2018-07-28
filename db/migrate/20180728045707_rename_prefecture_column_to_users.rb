class RenamePrefectureColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :prefecture, :pref
  end
end
