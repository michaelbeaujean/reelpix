class PlaylistsController < ApplicationController

  def index
  end

  def show_titles
    base_url = "http://staging-api-us.crackle.com/Service.svc/"
    title_name = params[:title_search]
    response = HTTParty.get("#{base_url}search/media/#{title_name}/us/")
    @crackle_item = response["CrackleItemList"]["Items"]["CrackleItem"]
  end

  def add_title
    @playlist = Playlist.find_by(id: 8)
    title = params[:title]
    @playlist.titles_hash["Title"] = title
    @playlist.save
    # binding.pry
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
    @playlist_user = session[:user_id]
    @playlist = Playlist.where(user_id: @playlist_user)
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to("/playlists")
  end

end
