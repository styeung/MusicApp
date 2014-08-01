class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :album_id, null: false
      t.string :edition, null: false
      t.text :lyrics
      t.timestamps
    end

    add_index :tracks, :name
    add_index :tracks, :album_id
    add_index :tracks, :edition
  end
end
