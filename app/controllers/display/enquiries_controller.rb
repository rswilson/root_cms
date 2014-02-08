class Display::EnquiriesController < ApplicationController
	layout "display"
	def index
		@site = current_site
		@enquiry = Enquiry.new
		
		@page = Page.find_by_name("Contact Us")
		@page.content += render_to_string :partial => "/display/enquiries/form"
		@page = render_page @page
  end
  
  def create
		@site = current_site
    @enquiry = Enquiry.new(params[:enquiry])
    if @enquiry.save
      flash[:success] = "Thank you for your enquiry, we will be in touch as soon as possible."
      redirect_to display_enquiries_path
    else
			@page = Page.find_by_name("Contact Us")
			@page.content += render_to_string :partial => "/display/enquiries/form"
			@page = render_page @page
    end
  end
end
