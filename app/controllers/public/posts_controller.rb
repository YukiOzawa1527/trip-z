class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @picture = @post.pictures.build
  end

  def index
    @posts = Post.all
    @pictures = Picture.where(post_id: @posts.pluck(:id))
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @picture = Picture.new
    @pictures = @post.pictures
    @post_review = PostReview.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tags(tag_list)
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :new
    end
  
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to my_page_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, pictures_attributes: [:id, :_destroy, :image])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path unless @post
  end

  
end
