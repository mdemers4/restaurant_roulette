class UsersController < ApplicationController

  def new
    @user = User.new
    if current_user 
      redirect_to reservations_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # added function to start session after user have signed-up
      redirect_to root_path, notice: "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
