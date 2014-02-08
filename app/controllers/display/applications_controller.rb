class Display::ApplicationsController < ApplicationController
	layout "display"
	def create
		@application = Application.new(params[:application])
		if @application.save
			flash[:success] = "Application successfully submitted. We will be in touch shortly. Thank you."
			redirect_to display_jobs_path
		else
			@site = current_site
			@job = @application.job
			@page = Page.find_by_name("Jobs")
			@page.content += render_to_string :partial => "/display/applications/form"
			@page = render_page @page			
		end
	end
end
