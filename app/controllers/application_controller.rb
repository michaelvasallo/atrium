class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_menu_variables
  before_action :set_cart

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path unless current_user
  end

  private

  def set_menu_variables
    @genres = Genre.all
  end

  def set_cart
    session[:cart] ||= []
  end
end
