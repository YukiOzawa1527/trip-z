class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @pictures = @post.pictures
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_root_path
  end
end
