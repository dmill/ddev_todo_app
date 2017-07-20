class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User successfully created.'
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to action: :show
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new_avatar
    @user = User.find(params[:id])
  end

  private

  def user_params
    # return params.require(:user).permit(:first_name, :last_name, :email, :dob)
    params.require(:user).permit(:first_name, :last_name, :email, :dob, :user_type, :avatar)
  end
end
