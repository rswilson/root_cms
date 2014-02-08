class Admin::PageTemplatesController < ApplicationController
	layout "admin"
	before_filter :check_logged_in

	def index
		@page_templates = PageTemplate.all
	end

	def new
		@page_template = PageTemplate.new
	end

	def show
		redirect_to edit_page_template_path(PageTemplate.find(params[:id]))
	end

	def create
		@page_template = PageTemplate.new(params[:page_template])
		@site = current_site
		
		if @page_template.save
			flash[:success] = "Successfully created page template."
			logger.info "*********** Page Template Id: #{@page_template.id}"
			if params[:page_template][:default_template].to_i == 1
				@site.default_template_id = @page_template.id
				@site.save
			end
			logger.info "*********** Page Template Id: #{@page_template.id}"
			redirect_to edit_page_template_path(@page_template)
		else
			render :action => 'new'
		end
	end

	def edit
		@page_template = PageTemplate.find(params[:id])
		if current_site.default_template == @page_template
			@page_template.default_template = 1
		end
	end

	def update
		@page_template = PageTemplate.find(params[:id])
		@site = current_site

		if params[:page_template][:default_template].to_i == 1
			@site.default_template_id = @page_template.id
		elsif params[:page_template][:default_template].to_i == 0 && @site.default_template_id == @page_template.id
			@site.default_template_id = nil
		end

		if (@page_template.update_attributes(params[:page_template]) && @site.save)
			puts "setting the flash and trying to redirect"
			flash[:success] = "Successfully updated page template."
			redirect_to edit_page_template_path(@page_template)
		else
			flash[:success] = "There was a problem updating the page template"
			render :action => :edit
		end
	end

	def destroy
		@page_template = PageTemplate.find(params[:id])
		@page_template.destroy
		flash[:success] = "Successfully destroyed page template."
		redirect_to page_templates_url
	end
end
