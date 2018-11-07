class UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    authorize @user
    User.find(params[:id]).destroy
    redirect_to users_path, notice: "User deleted."
  end


  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
end
