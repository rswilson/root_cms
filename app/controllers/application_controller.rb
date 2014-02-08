class ApplicationController < ActionController::Base
	helper :all # include all helpers, all the time
	before_filter :req_init
	include ControllerAuthentication
	protect_from_forgery
	
	after_filter :discard_flash_if_xhr

	protected
	def req_init
	        #if current_user
			        #   PaulDowman::RailsPlugins::BetterLogging.custom = current_user.username
					        #else
							        #   PaulDowman::RailsPlugins::BetterLogging.custom = "GUEST"
									        #end

	end

	protected
	def check_logged_in
		logger.info "ApplicationController::check_logged_in - Checking login"
		unless logged_in?
			logger.info "ApplicationController::check_logged_in - User not logged in, redirecting"
			flash[:warning] = "Please log in"
			redirect_to login_path
		end
	end
	
	def discard_flash_if_xhr
		flash.discard if request.xhr?
	end

	# Gets the current site
	# This is a placeholder with the future posibility of expanding the CMS
	# to govern multiple sites at onee
	def current_site
		return Site.first
	end

	# Get the default page template
	# If not defined, get the first template we made
	def default_page_template
		logger.debug "ApplicationController::default_page_template - Retrieving default page template"
		@site = current_site
		if !@site.default_template.nil?
			return @site.default_template
		else
			return PageTemplate.first
		end
	end

	# Display Methods
	# These govern all the generic rendering of the page templates and page content
	def render_page(page)
		logger.info "ApplicationController::render_page - Rendering page"
		
		# Ensure we have retrieved the site
		if @site.nil?
			@site = current_site
		end

		if !page.nil?
			@page = page
		end

		if @page.nil?
			logger.error "ApplicationController::render_page - Page passed to render_page was empty"
			logger.error "ApplicationController::render_page - Redirecting to error page"
			redirect_to :controller => "error", :action => "page_not_found" and return
			return
		end

		logger.info "ApplicationController::render_page - Checking page content"
		@page.final_content = @page.content

		logger.debug "ApplicationController::render_page - #{@page.final_content}"

		unless @page.page_template.nil?
			logger.info "ApplicationController::render_page - Page template found. Getting template content"
			@page.final_content = @page.page_template.content
			@page.final_content = @page.final_content.gsub(/#CONTENT#/, @page.content)
		end

		logger.info "ApplicationController::render_page - Attempting to render page element"
		handle_content("MENU", @page)
		handle_content("GALLERY", @page)
		handle_content("ALBUM", @page)
		handle_content("BLOG", @page)
		handle_content("POST", @page)
		handle_content("FORM", @page)
		handle_all_galleries @page
		handle_all_albums @page

		logger.info "ApplicationController::render_page - Page rendering complete"
		render :template => "/display/handle_request" and return
	end

	# Generic proc to strip out the content tags from the page
	# We then use the id's retreived from the tags and find the appropriate
	# model to render
	def handle_content (type_tag, page)
		logger.info "ApplicationController::handle_content - Checking for content with tag #{type_tag}"
		for match in page.final_content.scan(/##{type_tag}[0-9]*#/ ) do
			# Get the matched string
			@match_string = match.to_s
			logger.info "ApplicationController::handle_content - Matched string #{@match_string}"
			# Retreive the ID
			@type_id = @match_string.gsub(/##{type_tag}/, "")
			@type_id = @type_id.gsub(/#/, "")
			logger.info "ApplicationController::handle_content - Got type id: #{@type_id}"

			# Put a REPLACE placeholder so that we know that we have looked at this
			page.final_content = page.final_content.gsub(/##{type_tag}#{@type_id}#/, "#REPLACE_#{type_tag}#")

			# Get the item we want and render it
			@type_content = render_content(type_tag, @type_id)

			# Replace the tag placeholder with the content
			page.final_content = page.final_content.gsub(/#REPLACE_#{type_tag}#/, @type_content)
		end
	end

	# Actually render the object to a string
	# Uses the id we retrieved from the tag
	def render_content (type, id)
		case type
			when "MENU"
				#if @menu.nil?
				#	@menu = Menu.includes(:menu_items => [:page]).find(id)
				#end
				#@menu = Menu.includes(:menu_items => [{:page => :folder}]).find(id)
				@menu = Menu.find(id)
				return (render_to_string :partial => "/display/menus/menu", :object => @menu)
			when "GALLERY"
				if @gallery.nil?
					@gallery = Gallery.find(id)
				end
				@gallery = Gallery.find(id)
				return (render_to_string :partial => "/display/galleries/single_gallery", :locals => {:gallery => @gallery})
			when "ALBUM"
				if @album.nil?
					@album = Album.find(id)
				end
				@album = Album.find(id)
				return (render_to_string :partial => "/display/albums/single_album", :locals => {:album => @album})
			when "BLOG"
				if @blog.nil?
					@blog = Blog.find(id)
				end
				@blog = Blog.find(id)
				return (render_to_string :partial => "/display/blogs/blog", :object => @blog)
			when "POST"
				if @post.nil?
					@post = Post.find(id)
				end
				return (render_to_string :partial => "/display/blogs/post", :object => @post)
			when "FORM"
				if @form.nil?
					@form = Form.includes(fields: [:field_options]).find(id)
					@form_submission = @form.form_submissions.new
					i = 1
					for field in @form.fields do
						@form_submission.form_submission_fields.build(:field_id => field.id)
						#puts "#{i} with field_id: #{field.id} #{@form_submission.form_submission_fields[i].label_string}"
						i += 1
					end
					#3.times { @form_submission.form_submission_fields.build }
				end
				return (render_to_string :partial => "/display/forms/form", :object => @form_submission)
			else
				logger.error "ApplicationController::render_content - Unknown type, failed to render: #{type}"
		end
	end

	# Display all albums we have in the system
	# This is a special tag #ALL_ALBUMS# and as such does not require the usual ID tag stripping
	def handle_all_albums(page)
		while page.final_content =~ /#ALL_ALBUMS#/ do
			@albums = Album.all
			page.final_content = page.final_content.gsub(/#ALL_ALBUMS#/, "#REPLACE_ALBUM#")
			@albums_content = render_to_string :partial => "/display/albums/all_albums", :locals => {:albums => @albums}
			page.final_content = page.final_content.gsub(/#REPLACE_ALBUM#/, @albums_content)
		end
	end
	
	# Display all albums we have in the system
	# This is a special tag #ALL_GALLERIES# and as such does not require the usual ID tag stripping
	def handle_all_galleries(page)
		while page.final_content =~ /#ALL_GALLERIES#/ do
			@galleries = Gallery.all
			page.final_content = page.final_content.gsub(/#ALL_GALLERIES#/, "#REPLACE_GALLERIES#")
			@galleries_content = render_to_string :partial => "/display/galleries/all_galleries", :locals => {:galleries => @galleries}
			page.final_content = page.final_content.gsub(/#REPLACE_GALLERIES#/, @galleries_content)
		end
	end
	
	
	# Handle the parsing of links here
	# links have the format: <a data-page_id=""
	def handle_links (page)
		logger.info "ApplicationController::handle_links - Checking for links"
		for link in page.final_content.scan(/<a data-page_id=.*<\/a>/) do
			# Get the matched string
		  @match_string = link.to_s
			logger.info "ApplicationController::handle_links - Matched string #{@match_string}"
			
			@match_string =~ /data-page_id="[0-9]*"/
			@page_id = $~.to_s
			logger.info "ApplicationController::handle_links - Got the data-page_id #{@page_id}"
			@page_id =~ /"[0-9]*"/
			@page_id = $~.to_s.gsub("\"","")
			logger.info "ApplicationController::handle_links - Found the page_id #{@page_id}"
			@page_url = Page.find(@page_id).url
			logger.info "ApplicationController::handle_links - Found the page and url: #{Page.find(@page_id)} #{@page_url}"
			
			@new_link = @match_string.gsub(/href=".*"/, "href=\"#{@page_url}\"")
			#@new_link = @new_link.gsub(/data-page_id=".*"/, "")
			page.final_content = page.final_content.gsub(@match_string, @new_link)
		end
	end
	
	def set_log_prefix (prefix)
		Logging.mdc['method'] = "##{prefix}"
	end
	
	def clear_log_prefix ()
		Logging.mdc['method'] = ""
	end
end
