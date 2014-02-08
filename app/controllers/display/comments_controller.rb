class Display::CommentsController < ApplicationController
	before_filter :get_post
	layout "display"
	def get_post
		@post = Post.find(params[:post_id])
	end

	# Add a comment to a post
	# Redirects back to the relevant post using the redirect_url
	def create
		@comment = @post.comments.new(params[:comment])
		if @comment.save
			if @comment.post.blog.approve_comments
				flash[:success] = "Thanks for submitting your comment. It is now awaiting approval."
			else
				flash[:success] = "Successfully added your comment."
			end
			logger.info "Comment created"
			respond_to do |format|
				format.html {
					@blog = nil
					render_page(Page.find(params[:page_id]))
				}
				format.js {
					logger.info "Rendering"
					render "/display/comments/ajax/success"
					logger.info "Done Rendering"
					return
				}
			end
			logger.info "Returning"
			return
		else
			respond_to do |format|
				format.html { render_page(Page.find(params[:page_id])) }
				format.js {render "/display/comments/ajax/failure" and return}
			end
		end
		#redirect_to "#{params[:comment][:redirect_url]}"
	end
end
