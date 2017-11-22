class AddressesController < ApplicationController
  before_action :set_provinces

  def new
    @address = User.find_by!(username: params[:username]).build_address
  end

  def create
    @address = User.find_by!(username: params[:username]).build_address(address_params)
    @address.save!
    redirect_to user_path(current_user.username)
  rescue ActiveRecord::RecordInvalid
    flash[:errors] = @address.errors.full_messages
    render :new
  end

  private

  def set_provinces
    @provinces = Province.all
  end

  def address_params
      params.require(:address).permit(:line_1,
                                      :line_2,
                                      :city,
                                      :postal_code,
                                      :province_id)
  end
end
