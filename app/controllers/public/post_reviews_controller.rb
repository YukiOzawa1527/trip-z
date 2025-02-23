class Public::PostReviewsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    review = current_user.post_reviews.new(post_review_params)
    review.post_id = post.id
    review.save
    redirect_to request.referer
  end

  def destroy
    PostReview.find_by(id: params[:id], post_id:params[:post_id]).destroy
    redirect_to request.referer
  end

  private
  def post_review_params
    params.require(:post_review).permit(:star)
  end
end
