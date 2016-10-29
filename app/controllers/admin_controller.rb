class AdminController < ActionController::Base
	before_action :access

	before_action :set_post, only: [:edit_post, :update_post, :destroy_post]
	before_action :set_user, only: [:edit_user, :update_user, :destroy_user]
	before_action :set_category, only: [:update_category, :destroy_category]
	before_action :set_comment, only: [:edit_comment, :update_comment, :destroy_comment]

	before_action :check_for_query_post, only: :index
	before_action :check_for_query_user, only: :index
	before_action :check_for_query_comment, only: :index
	
	# authorize_resource

	rescue_from ActiveRecord::RecordNotFound, with: -> { render 'not_found/index', layout: 'not_found' } 
	
	def index
		@comments = Comment.latest.limit(3)
		@posts = Post.latest.limit(3)
		@users = User.latest.limit(5)
	end
	
	# post pages

	def show_all_posts
		@posts = Post.latest.page(params[:page]) 
	end		

	def search_posts
		redirect_to admin_path unless params[:query_post].present?
		@posts = Post.search(params[:query_post]).latest.page(params[:page]) 
	end	

	def new_post
		@post = Post.new
	end	

	def edit_post
		
	end	

	# category pages

	def all_categories 
		@categories = Category.all
	end	

	def new_category
		@category = Category.new
	end	

	# comment pages

	def all_comments
		@comments = Comment.latest.page(params[:page])
	end
	
	def search_comments
		redirect_to admin_path unless params[:query_comment].present?
		@comments = Comment.search(params[:query_comment]).latest.page(params[:page]) 
	end

	def edit_comment

	end	

	# user pages

	def all_users
		@users = User.page(params[:page]) 
	end	

	def search_users
		redirect_to admin_path unless params[:query_user].present?
		@users = User.search(params[:query_user]).page(params[:page]) 
	end	

	def new_user
		@user = User.new
	end	

	def edit_user

	end	

	# user actions

	def create_user
		@user = User.new(user_params)
		@user.skip_confirmation!

		if @user.save
			redirect_to edit_user_admin_path(@user), notice: "Користувач успішно створений"
		else
			render :new_user
		end	
	end	

	def update_user
		@user.avatar.try(:destroy) if params[:drop_file]

		if user_params[:password].empty?
			if @user.update_without_password(user_params) 	
				redirect_to edit_user_admin_path(@user), notice: "Користувач успішно оновлений"
			else
				render :edit_user
			end	
		else
			if @user.update(user_params) 	
				redirect_to edit_user_admin_path(@user), notice: "Користувач успішно оновлений"
			else
				render :edit_user
			end	
		end	
	end	

	def destroy_user
		@user.destroy
		redirect_to users_admin_path, notice: "Користувач успішно видалений"
	end	

	# post actions

	def create_post
		@post = Post.new(create_post_params)
		
		if @post.save
			redirect_to edit_post_admin_path(@post), notice: "Запис успішно добавлена"
		else
			render :new_post
		end		
	end

	def update_post
		@post.thumbnail.try(:destroy) if params[:drop_file]

		if @post.update(update_post_params)

			redirect_to edit_post_admin_path(@post), notice: "Запис успішно оновлена"
		else
			render :edit_post
		end	
	end	

	def destroy_post
		@post.destroy
		redirect_to posts_admin_path, notice: "Запис успішно видалена"
	end	

	# category actions

	def create_category
		@category = Category.new(category_params)

		respond_to do |format|
			if @category.save
				format.js
			else
				format.js
				format.json { render json: @category.errors }
			end		
		end	
	end

	def update_category
		respond_to do |format|
			if @category.update(category_params)
				format.js { redirect_to categories_admin_path, notice: "Категорія успішно оновлена" }
			else
				format.js
				format.json { render json: @category.errors }
			end	
		end
	end	

	def destroy_category
		@category.destroy
		redirect_to categories_admin_path, notice: "Категорія успішно видалена"
	end	

	# comment actions

	def update_comment
		if @comment.update(comment_params)

			redirect_to edit_comment_admin_path(@comment), notice: "Коментар успішно оновлений"
		else
			render :edit_comment
		end	
	end	

	def destroy_comment
		@comment.destroy
		redirect_to comments_admin_path, notice: "Коментар успішно видалений"
	end	

	private
		def access
			render 'not_found/index', layout: 'not_found' unless current_user.try(:admin)
		end	

		def set_post
			@post = Post.find(params[:id])
		end	

		def set_user
			@user = User.find(params[:id])
		end	

		def set_category 
			@category = Category.find(params[:id])
		end	

		def set_comment
			@comment = Comment.find(params[:id])
		end	

		def check_for_query_post
			redirect_to search_posts_admin_path(params[:query_post]) if params[:query_post].present?
		end	

		def check_for_query_user
			redirect_to search_users_admin_path(params[:query_user]) if params[:query_user].present?
		end	

		def check_for_query_comment
			redirect_to search_comments_admin_path(params[:query_comment]) if params[:query_comment].present?
		end	

		def comment_params
			params.require(:comment).permit(:content)
		end	

		def category_params
			params.require(:category).permit(:name)
		end	

		def create_post_params
			params.require(:post).permit(:title, :content, :published, :thumbnail, { category_ids: [] })
		end	

		def update_post_params
			params.require(:post).permit(:title, :content, :published, :thumbnail, { category_ids: [] })
		end	

		def user_params
			params.require(:user).permit(:login, :email, :name, :password, :avatar)
		end	
end	