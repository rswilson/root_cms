class Admin::BlogsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	
	def index
		logger.info "Admin:BlogsController::index - Going to Blogs index page"
		@blogs = Blog.all
	end
	
	def new
		logger.info "Admin:BlogsController::new - Going to the new Blog page"
		@blog = Blog.new
	end
	
	def create
		logger.info "Admin:BlogsController::create - Creating new blog"
		@blog = Blog.new(params[:blog])
		if @blog.save
			logger.info "Admin:BlogsController::create - Successfully created new blog: blog_id #{@blog.id}"
			flash[:success] = "Successfully created blog."
			redirect_to edit_blog_path(@blog)
		else
			logger.info "Admin:BlogsController::create - Failed to save new blog"
			render :action => 'new'
		end
	end
	
	def edit
		logger.info "Admin:BlogsController::edit - Editing blog: blog_id #{params[:id]}"
		@blog = Blog.find(params[:id])
	end
	
	def update
		logger.info "Admin:BlogsController::update - Updating blog: blog_id #{params[:id]}"
		@blog = Blog.find(params[:id])
		if @blog.update_attributes(params[:blog])
			logger.info "Admin:BlogsController::update - Successfully updated blog: blog_id #{@blog.id}"
			flash[:success] = "Successfully updated blog."
			redirect_to edit_blog_path(@blog)
		else
			logger.info "Admin:BlogsController::update - Failed to update blog: blog_id #{@blog.id}"
			render :action => 'edit'
		end
	end
	
	def destroy
		logger.info "Admin:BlogsController::destroy - Destroying blog: blog_id #{params[:id]}"
		@blog = Blog.find(params[:id])
		@blog.destroy
		logger.info "Admin:BlogsController::destroy - Successfully destroyed blog: blog_id #{params[:id]}"
		flash[:success] = "Successfully destroyed blog."
		redirect_to blogs_url
	end
end
