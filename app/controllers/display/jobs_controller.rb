class Display::JobsController < ApplicationController
	layout "display"
	def index
		@job = Job.first()
		@application = @job.applications.new
		
		@site = current_site
		@page = Page.find_by_name("Jobs")
		@page.content += render_to_string :partial => "/display/applications/form"
		@page = render_page @page
	end
end
