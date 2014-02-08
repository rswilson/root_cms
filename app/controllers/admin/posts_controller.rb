class Admin::PostsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_blog
	
	def get_blog
		@blog = Blog.find(params[:blog_id])
	end

	def index
		@posts = @blog.posts.all
	end

	def new
		@post = @blog.posts.new
	end
	
	def create
		@post = @blog.posts.new(params[:post])
		if @post.save
			flash[:success] = "Successfully created post."
			redirect_to edit_blog_post_path(@post.blog, @post)
		else
			render :action => 'new'
		end
	end
	
	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = @blog.posts.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:success] = "Successfully updated post."
			redirect_to edit_blog_post_path(@post.blog, @post)
		else
			render :action => 'edit'
		end
	end
	
	def destroy
		@post = @blog.posts.find(params[:id])
		@post.destroy
		flash[:success] = "Successfully destroyed post."
		redirect_to edit_blog_path(@blog)
	end
end
