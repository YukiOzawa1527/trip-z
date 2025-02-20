class Admin::HomesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def top
    @posts = Post.all
    @pictures = Picture.where(post_id: @posts.pluck(:id))
  end

  def about
  end
end
