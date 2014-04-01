class AddingMoreAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :text
    add_column :users, :location, :text
    add_column :users, :age, :integer
    add_column :users, :favorite_movies, :text
    remove_column :playlists, :titles_hash
  end
end
