class Public::PicturesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @picture = @post.pictures.new(picture_params)
    if @picture.save
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      @pictures = @post.pictures
      flash.now[:alert] = "failed"
      render 'public/posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "success"
    redirect_to post_path(@post)
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
