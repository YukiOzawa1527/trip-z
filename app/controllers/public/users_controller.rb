class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def mypage
    @posts = current_user.posts
    @user = current_user
  end

  def edit
    @user = current_user
    
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_new = Post.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number, :prefecture_id, :email, :birthday, :introduction )
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(my_page_url) unless current_user == @user
  end
end