class Admin::CommentsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_post
	
	def get_post
		@post = Post.find(params[:post_id])
	end
	
	def new
		logger.info "Admin:CommentsController::new - New Comment page"
		@comment = @post.comments.new
	end
	
	def create
		logger.info "Admin:CommentsController::create - Creating new comment"
		@comment = @post.comments.new(params[:comment])
		if @comment.save
			logger.info "Admin:CommentsController::create - Successfully created comment: comment_id #{@comment.id}"
			flash[:success] = "Successfully created comment."
			redirect_to edit_blog_post_path(@comment.post.blog, @comment.post)
		else
			logger.info "Admin:CommentsController::create - Failed to create comment"
			render :action => 'new'
		end
	end
	
	def edit
		logger.info "Admin:CommentsController::edit - Editing comment: comment_id #{params[:id]}"
		@comment = @post.comments.find(params[:id])
	end
	
	def update
		logger.info "Admin:CommentsController::update - Updating comment: comment_id #{params[:id]}"
		@comment = @post.comments.find(params[:id])
		if @comment.update_attributes(params[:comment])
			logger.info "Admin:CommentsController::update - Successfully updated comment: comment_id #{@comment.id}"
			flash[:success] = "Successfully updated comment."
			redirect_to edit_blog_post_path(@comment.post.blog, @comment.post)
		else
			logger.info "Admin:CommentsController::update - Failed to update comment: comment_id #{params[:id]}"
			render :action => 'edit'
		end
	end
	
	def destroy
		logger.info "Admin:CommentsController::destroy - Destroying comment: comment_id #{params[:id]}"
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		logger.info "Admin:CommentsController::destroy - Successfully destroyed comment: comment_id #{params[:id]}"
		flash[:success] = "Successfully destroyed comment."
		respond_to do |format|
			format.html { redirect_to edit_blog_post_path(@comment.post.blog, @comment.post) }
			format.js {render "/admin/comments/ajax/destroyed" and return}
		end
	end

	def approve
		logger.info "Admin:CommentsController::approve - Approving comment: comment_id #{params[:comment_id]}"
		@comment = @post.comments.find(params[:comment_id])
		@comment.approved = true
		
		respond_to do |format|
			if @comment.save
				logger.info "Admin:CommentsController::approve - Successfully approved comment: comment_id #{@comment.id}"
				format.html { redirect_to edit_blog_post_path(@comment.post.blog, @comment.post) }
				format.js {render "/admin/comments/ajax/approve" and return}
			else
				logger.info "Admin:CommentsController::approve - Failed to approve comment: comment_id #{@comment.id}"
				format.html { redirect_to edit_blog_post_path(@comment.post.blog, @comment.post) }
				format.js {render "/admin/comments/ajax/approve" and return}
			end
		end
	end
	
	def reject
		logger.info "Admin:CommentsController::reject - Rejecting comment: comment_id #{params[:comment_id]}"
		@comment = @post.comments.find(params[:comment_id])
		@comment.approved = false
		
		respond_to do |format|
			if @comment.save
				logger.info "Admin:CommentsController::reject - Successfully rejected comment: comment_id #{@comment.id}"
				format.html { redirect_to edit_blog_post_path(@comment.post.blog, @comment.post) }
				format.js {render "/admin/comments/ajax/reject" and return}
			else
				logger.info "Admin:CommentsController::reject - Failed to reject comment: comment_id #{@comment.id}"
				format.html { redirect_to edit_blog_post_path(@comment.post.blog, @comment.post) }
				format.js {render "/admin/comments/ajax/reject" and return}
			end
		end
	end
end
