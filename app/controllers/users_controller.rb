class UsersController < ApplicationController
  before_filter :correct_user,   only: [:update, :destoy]
  before_filter :admin_user,     only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @userposts = @user.posts.all

    @users= User.all
  end

  def new
    @user = User.new
  end

  def create_admin
    @user = User.new(params[:user])
    @user.is_admin=true
    if @user.save
      redirect_to :back
    else
      render "pages/home"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render "pages/home"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def admin_user
    redirect_to root_path unless current_user.is_admin?
  end

end
