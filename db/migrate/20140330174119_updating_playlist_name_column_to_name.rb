class UpdatingPlaylistNameColumnToName < ActiveRecord::Migration
  def change
    rename_column :playlists, :playlist_name, :name
  end
end
