class DisplayController < ApplicationController

	caches_page :handle_request

	# A catch all request handler, deals with all incoming requests (bar admin requests)
	def handle_request
		logger.info "==> DisplayController::handle_request"
		@site = current_site

		# If we can't find the current site, redirect to the new site url
		if @site.nil?
			logger.info "DisplayController::handle_request - Site not found. Redirecting to new site url"
			@site = Site.new
			redirect_to new_site_url and return
		end
		logger.info "Got params #{params} #{request.fullpath}"
		#@path = params[:path] || ""
		@path = request.fullpath || ""
		@path = CGI::unescape(@path)
		@page_name = @path.split("/").last
		logger.info "DisplayController::handle_request - #{@path} Page: #{@page_name}"

		# If we don't have a page name (maybe we had /) try and show the default start page of this site
		if @page_name.nil? || @page_name == ""
			logger.info "DisplayController::handle_request - No page name found in the URL, checking for the start page"
			@page = get_start_page
			if @page.nil?
				logger.info "DisplayController::handle_request - No start page found. Redirecting to error page"
				redirect_to :controller => "error", :action => "no_start_page"
				return
			else
				logger.info "DisplayController::handle_request - Found start page. Rendering: #{@page}"
				render_page @page
			end
		else
			# Get all the pages with this filename and work determine which is correct
			@pages = Page.find_all_by_filename(@page_name)
			logger.info "DisplayController::handle_request - Finding all page with name #{@page_name}"
			logger.debug "DisplayController::handle_request - Found #{@pages.size} pages"

			if @pages.size == 0
				logger.info "DisplayController::handle_request - Found no pages with matching filename: #{@page_name}. Displaying error"
				redirect_to :controller => "error", :action => "page_not_found" and return
			end
			
			# Compare the URL path with the expected page url
			for page in @pages
				logger.info "DisplayController::handle_request - comparing |#{page.url.gsub(/\//,'')}| vs. |#{@path.gsub(/\//,'')}|"
				if page.url.gsub(/\//,"") == @path.to_s.gsub(/\//,'')
					logger.info "DisplayController::handle_request - Correct page found with url #{page.url}"
					@page = page
					break
				end
			end

			if @page.nil?
				logger.info "DisplayController::handle_request - Found no pages with matching path: #{@path}. Displaying error"
				redirect_to :controller => "error", :action => "page_not_found" and return
			end
			render_page @page
		end
		logger.info "<==DisplayController::handle_request"
	end

	# Retrieve the start page for the site
	# If we can't find the site, redirect to the new site page
	def get_start_page
		@site = Site.first
		if @site.nil?
			logger.info "DisplayController::get_start_page - Site not found. Redirecting to new site url"
			redirect_to new_site_url and return -1
		end
		return @site.start_page
	end

	# TODO
	# Show album method. Special handler. Might need to integrate this in a more generic fashion
	def show_album
		@album = Album.find(params[:id])
	
		logger.info "DisplayController::show_album - Showing album: #{params[:id]}"
		
		@page_template = default_page_template
		@page = Page.new

		if !@page_template.nil?
			logger.info "DisplayController::show_album - Found template. Rendering content."
			@page.page_template = @page_template
			@page.final_content = @page_template.content
			@page.final_content = @page.final_content.gsub(/#CONTENT#/, "#ALBUM#{@album.id}#")
		else
			logger.info "DisplayController::show_album - No default template set. Just blank template."
			@page.page_template = PageTemplate.new
			@page.final_content = "#ALBUM#{@album.id}#"
		end

		handle_content "MENU", @page
		handle_content "ALBUM", @page
		if @album.title.nil? || @album.title == ""
			@page.title = "#{@album.gallery.name} - #{@album.name}"
		else
			@page.title = "#{@album.gallery.name} - #{@album.title}"
		end
		logger.info "DisplayController::show_album - Album rendering complete. Sending to handle_request."
		render :action => "handle_request"
	end

end
