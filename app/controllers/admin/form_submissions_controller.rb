class Admin::FormSubmissionsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_form
	
	def get_form
	  begin
		  @form = Form.find(params[:form_id])
		rescue
		  @form = nil
	  end
	end

	def index
		@form_submissions = @form.form_submissions.all
		@form_submissions_seen = @form.form_submissions.where(:viewed => false)
		@form_submissions_unseen = @form.form_submissions.where(:viewed => true)
	end

	def show
		@form_submission = @form.form_submissions.find(params[:id])
		if !@form_submission.viewed
		  @form_submission.viewed = true
		  @form_submission.save
	  end
	end
	
	def destroy
		@form_submission = @form.form_submissions.find(params[:id])
		@form_submission.destroy
		flash[:success] = "Successfully destroyed form submission."
		redirect_to form_form_submissions_url
	end

end
