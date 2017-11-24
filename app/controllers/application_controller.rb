class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_menu_variables
  before_action :set_cart

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    redirect_to :login unless current_user
  end

  def authorize_user(user)
    redirect_to :root unless current_user == user
  end

  private

  def set_menu_variables
    @genres = Genre.all
  end

  def set_cart
    session[:cart] ||= []
  end
end
