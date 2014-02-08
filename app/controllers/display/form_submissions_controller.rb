class Display::FormSubmissionsController < ApplicationController
	before_filter :get_form
	layout "display"

	def get_form
	  begin
		  @form = Form.find(params[:form_submission][:form_id])
		rescue
		  @form = nil
	  end
	end

	def create
		for value in params[:form_submission][:form_submission_fields_attributes] do
			puts "#{value[1][:name]}"
			puts "#{value[1][:value]}"
			if value[1][:value].kind_of?(Array)
				result = value[1][:value] * "|"
				puts "#{result}"
				value[1][:value] = result
			end
		end
		
		@form_submission = @form.form_submissions.new(params[:form_submission])
		if @form_submission.save
			if @form_submission.form.send_notification
				#FormSubmissionMailer.form_submitted(@form_submission).deliver
				FormSubmissionMailer.delay.form_submitted(@form_submission)
			end
			flash[:success] = @form.submission_message || "Successfully created form submission."
			#@form = nil
			#render_page(Page.find(params[:page_id]))
			respond_to do |format|
				format.html {
					@form = nil
					render_page(Page.find(params[:page_id]))
				}
				format.js {render "/display/forms/ajax/success"}
			end
			return
		else
			logger.error "Saving form failed #{@form.id}"
			respond_to do |format|
				format.html {
					render_page(Page.find(params[:page_id])) and return
				}
				format.js {
					@page = Page.find(params[:page_id])
					render "/display/forms/ajax/failure" and return
				}
			end
		end
	end
	
	def index
		redirect_to "/"
	end
end
