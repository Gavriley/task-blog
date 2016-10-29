class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy, :update]
  before_action :set_comment, only: [:update, :destroy]
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, :through => :post, :singleton => true
  
	def create
		@comment = current_user.comments.new(comment_params)
		@comment.post = @post

		respond_to do |format|
			if @comment.save
				format.js { redirect_to post_path(@post) + "#post-comment-block", alert: "Коментар успішно створено" }
			else
				format.js
				format.json { render json: @comment.errors }
			end		
		end	
	end

	def update

		respond_to do |format|
			if @comment.update(comment_params)
				format.js { redirect_to post_path(@post) + "#post-comment-block", alert: "Коментар успішно оновлений" }
			else
				format.js
				format.json { render json: @comment.errors }
			end	
		end	
	end

	def destroy
		@comment.destroy
		
		respond_to do |format|
			format.js { redirect_to post_path(@post) + "#post-comment-block", alert: "Коментар успішно видалений" }
		end	
	end

	private
		def set_post
			@post = Post.find params[:post_id]
		end	

		def set_comment
			@comment = @post.comments.find(params[:id]) 
		end

		def comment_params
			params.require(:comment).permit(:content)
		end	
end	