class Public::HomesController < ApplicationController
  before_action :redirect_to_posts_if_logged_in, only: [:top]

  def top
  end

  def about
  end

  def guest_sign_in
    @user = User.guest
    sign_in @user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def redirect_to_posts_if_logged_in
    if user_signed_in?
      redirect_to posts_path
    end
  end
end
