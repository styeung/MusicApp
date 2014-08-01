class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :band_id, null: false
      t.string :name, null: false
      t.string :environment, null: false
      t.timestamps
    end

    add_index :albums, :band_id
    add_index :albums, :name
    add_index :albums, :environment
  end
end
