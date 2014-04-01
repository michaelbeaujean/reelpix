class TitlesController < ApplicationController

  def create
    # binding.pry
    title = params["title"]["Title"]
    playlist_id = params["title"]["playlist_id"]
    playlist = Playlist.find_by(id: playlist_id)
    new_title = Title.create(name: title)
    playlist.titles << new_title
    redirect_to("/playlists/#{playlist_id}")
  end

end
