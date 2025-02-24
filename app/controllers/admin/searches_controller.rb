class Admin::SearchesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def search
    @model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'post'
			@records = Post.search_for(@content, @method)
		elsif @model == 'tag'
			@records = Tag.search_posts_for(@content, @method)
		end
    render 'admin/searches/search'
  end
end
