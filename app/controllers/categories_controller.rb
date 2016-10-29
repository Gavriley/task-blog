class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]
	load_and_authorize_resource

	def show
		@posts = @category.posts.latest.page(params[:page])
	end	

	private
		def set_category
			@category = Category.find(params[:id])
		end	
end	