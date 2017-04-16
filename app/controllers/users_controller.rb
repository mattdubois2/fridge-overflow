class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Registered successfully'
      redirect_to root_path
    else
      flash[:notice] = 'Registration failed'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile updated"
      render :show
    else
      flash[:notice] = "Profile not updated"
      render :edit
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:username, :real_name, :email, :password, :website, :location, :age)
  end

end
