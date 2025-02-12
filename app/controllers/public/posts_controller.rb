class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new
    @post.save
    redirect_to post_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
