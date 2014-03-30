class PlaylistsController < ApplicationController

  def index
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new
    @playlist.name = params[:playlist][:name]
    @playlist.user_id = session[:user_id]
    if @playlist.save
      redirect_to("/")
    else
      render(:new)
    end
  end

  def show
    playlist_user = session[:user_id]
    @playlist = Playlist.where(user_id: playlist_user)
  end

end
