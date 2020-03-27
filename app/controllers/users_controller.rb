class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :logged_in, only: [:new,:create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id]=@user.id
      redirect_to movies_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit; end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
   @user.destroy
    redirect_to new_user_path
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
