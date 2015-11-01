class PostsController < ApplicationController

	def index
	end

	def create
		@post = Post.create(params[:post])
	end

	def new
		@post = Post.new
	end

end
