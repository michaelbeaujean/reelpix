class AddingFavTvShowsToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_tv_shows, :text
  end
end
