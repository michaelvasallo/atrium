class AddressesController < ApplicationController
  before_action :set_provinces

  def new
    user = User.find_by!(username: params[:username])
    authorize_user user
    @address = user.build_address
  end

  def create
    @address = User.find_by!(username: params[:username]).build_address(address_params)
    @address.save!
    redirect_to user_path(current_user.username)
  rescue ActiveRecord::RecordInvalid
    flash[:errors] = @address.errors.full_messages
    render :new
  end

  def edit
    @user = User.find_by!(username: params[:username])
    authorize_user @user
    @address = @user.address
  end

  def update
    @address = User.find_by!(username: params[:username]).address
    @address.update_attributes(address_params)

    redirect_to user_path(current_user.username)
  rescue ActiveRecord::RecordInvalid
    flash[:errors] = @address.errors.full_messages
    render :edit
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
