class ChangeDatatypeDurationOfMusics < ActiveRecord::Migration[5.2]
  def change
  	change_column :musics, :duration, :string
  end
end
