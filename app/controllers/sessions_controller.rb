class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      flash[:error] = 'You have entered an incorrect username or password'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    session.delete :cart
    redirect_back fallback_location: :root
  end
end
