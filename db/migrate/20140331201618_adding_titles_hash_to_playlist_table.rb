class AddingTitlesHashToPlaylistTable < ActiveRecord::Migration
  def change
    add_column :playlists, :titles_hash, :text
  end
end
