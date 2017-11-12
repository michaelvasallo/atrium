class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_menu_variables

  def set_menu_variables
    @genres = Genre.all
  end
end
