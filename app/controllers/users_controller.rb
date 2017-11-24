class UsersController < ApplicationController
  def new
    @user = User.new
    @address = Address.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    session[:user_id] = @user.id
    redirect_to new_address_path(@user.username)
  rescue ActiveRecord::RecordInvalid
    flash[:errors] = @user.errors.full_messages
    render :new
  end

  def show
    @user = User.find_by!(username: params[:username])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :password_confirmation,
                                 :email,
                                 :first_name,
                                 :last_name)
  end
end
