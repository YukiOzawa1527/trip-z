class Public::UsersController < ApplicationController
  def mypage
    @posts = current_user.posts
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
    @user.update(user_params)
      redirect_to my_page_path
  end

  def destroy
  end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :phone_number, :prefecture_id, :email, :birthday, :introduction )
end
