class SessionController < ActiveRecord::Base

  def new
  end

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        user.id = session[:user_id]
        redirect_to("/users/#{user.id}")
      else
        render(:new)
      end
    end

    def destroy
      session_reset
      redirect_to(root_path)
    end

end
