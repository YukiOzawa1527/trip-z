class Admin::PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :check_admin_or_author, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user, only: [:edit, :update, :destroy]

  def edit
  end

  def update
  end

  def destroy
  end

  def check_admin_or_author
    unless current_user.admin? || @post.user == current_user
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
