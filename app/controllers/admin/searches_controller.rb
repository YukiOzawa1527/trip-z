class Admin::SearchesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def search
    @model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Post.search_for(@content, @method)
		end
    render 'searches/search'
  end
end
