class PlaylistsController < ApplicationController
  require 'uri'

  def index
  end

  def show_titles
    @titles = Playlist.fetch_titles(params[:title_search])
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

  def edit
    @playlist_id = params[:id]
    @playlist = Playlist.find_by(id: @playlist_id)
  end

  def update
    @playlist_id = params[:id]
    @playlist = Playlist.find_by(id: @playlist_id)
    @playlist.update(name: params[:playlist][:name])
    redirect_to("/playlists/#{@playlist_id}")
  end

  def show
    # binding.pry
    @playlist_user = session[:user_id]
    @playlist = Playlist.find_by(id: params[:id])
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to("/playlists")
  end

end
