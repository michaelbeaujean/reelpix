class SessionController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to("/users/#{user.id}")
      else
        redirect_to("/")
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to("/")
    end

end
