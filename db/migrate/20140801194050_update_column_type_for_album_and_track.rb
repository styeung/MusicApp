class UpdateColumnTypeForAlbumAndTrack < ActiveRecord::Migration
  def change
    remove_column(:albums, :band_id)
    add_column(:albums, :band_id, :integer, null: false)
    add_index(:albums, :band_id)
    remove_column(:tracks, :album_id)
    add_column(:tracks, :album_id, :integer, null: false)
    add_index(:tracks, :album_id)
  end
end
