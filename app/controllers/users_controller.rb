class UsersController < ApplicationController
  def index; end

  def show
    return unless params[:id] == 'sign_out'

    sign_out current_user
    redirect_to new_user_session_path
  end

  def create
    @user = User.new(sign_up_params)

    if @user.save
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
