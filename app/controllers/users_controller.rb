class UserController < ApplicationController
 before_action :authenticate_user!

  def index
    @users = collection
  end
 
  def show
    @user = resource
  end 

  def edit
    @user = resource
  end

  def update
    @user = resource
    if @user.update(user_params)
      redirect_to account_user_path(user: @user)
    else
      render :edit
    end
  end

  private

  def collection
    User.all
  end

  def resource
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :role)
  end
end
