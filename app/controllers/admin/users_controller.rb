class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @active_users = User.active_users
    @reject_users = User.reject_users
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(is_active: false)
    flash[:notice] = "退会処理を実行しました。"
    redirect_to admin_user_path(@user)
  end
end

private

def user_params
  params.require(:user).permit(:is_active)
end
