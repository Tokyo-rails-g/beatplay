class ChangeDatatypeTitleOfContacts < ActiveRecord::Migration[5.2]
  def change
  	change_column :contacts, :title, :integer
  end
end
