class TitlesController < ApplicationController

  def create
    # binding.pry
    title = params["title_result"]["Title"]
    playlist_id = params["title_result"]["playlist_id"]
    playlist = Playlist.find_by(id: playlist_id)
    new_title = Title.new(name: title)
    playlist.titles << new_title
    redirect_to("/playlists/#{playlist_id}")
    end

end
