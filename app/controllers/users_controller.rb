class UsersController < ApplicationController

  def index
    redirect_to("/")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to("/")
      else
        render :new
      end
  end

  def edit
    user_id = params[:id]
    @user = User.find_by(id: user_id)
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @playlists = Playlist.where(user_id: user_id)
    # binding.pry
  end

  def destroy
    @user = User.find(params[:id])
    @playlist.destroy

    redirect_to("/")
  end

    private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :image_url,
        :location,
        :age,
        :favorite_movies,
        :favorite_tv_shows,
        :username
        )
    end

end
