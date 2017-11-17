class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_menu_variables
  before_action :set_cart

  private

  def set_menu_variables
    @genres = Genre.all
  end

  def set_cart
    session[:cart] = [] unless session[:cart]
  end
end
