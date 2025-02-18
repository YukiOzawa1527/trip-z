class Admin::HomesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def top
    @posts = Post.all
  end

  def about
  end
end
