class PostsController < ApplicationController
	before_action :check_for_query, only: :index
	load_and_authorize_resource
	
	def index
		@posts = Post.published_posts.page(params[:page]) 
	end
	
	def search
		redirect_to root_path unless params[:query].present?
		@posts = Post.search_published_posts(params[:query]).latest.page(params[:page]) 
	end	

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comment.post = @post
	end	
	
	private
		def check_for_query
			redirect_to search_posts_path(query: params[:query]) if params[:query].present?
		end	
end	