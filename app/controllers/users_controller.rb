class UsersController < ApplicationController
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
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = resource
    if @user.update_attribute(:active, false)
      flash[:notice] = 'User was deactivated!'
      redirect_to users_path
    else
      flash[:warning] = "User is already deactivated"
      redirect to users_path
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
                                 :password_confirmation, :active, :role)
  end
end
