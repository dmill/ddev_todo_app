class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    # p 'PARAMS'
    # p params

    @user = User.new(allowed_params)
    if @user.save
      flash[:notice] = 'User successfully created.'
      redirect_to @user
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def allowed_params
    # return params.require(:user).permit(:first_name, :last_name, :email, :dob)
    return params.require(:user).permit(:first_name, :last_name, :email, :dob, :user_type)
  end
end
