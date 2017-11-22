class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_back fallback_location: :root
  end
end
