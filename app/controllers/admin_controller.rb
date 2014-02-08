class AdminController < ApplicationController
	before_filter :check_logged_in
	
	
	# When going to the index, check for the current site
	# If we cannot find it, redirect to the site creation page
	def index
		logger.info "==> index"
		@site = Site.first()
		if @site.nil?
			logger.info "No site found - redirecting to new site url"
			@site = Site.new
			logger.info "<== index"
			redirect_to new_site_url
		end
		
		# Get Stats
		@comments_awaiting_approval = Comment.where("approved != true || approved is null")
		
		if session[:user_last_logged_in_at].nil?
		  @forms_with_unviewed_submissions = Form.includes(:form_submissions).where("form_submissions.viewed != true")
	  else
	    @forms_with_unviewed_submissions = Form.includes(:form_submissions).where("form_submissions.viewed != ? and form_submissions.created_at > ?", true, session[:user_last_logged_in_at])
	  end
		logger.info "<== index"
	end

end
