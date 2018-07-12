class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :disc_id
      t.integer :track_number
      t.string :name
      t.integer :bpm
      t.datetime :duration
      t.timestamps
    end
  end
end
