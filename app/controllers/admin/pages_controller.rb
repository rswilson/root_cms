class Admin::PagesController < ApplicationController
	layout :choose_layout
	before_filter :check_logged_in

	def index
		set_log_prefix("index")
		@folders = Folder.where("parent_id is NULL").order("name asc").all
		@pages = current_site.pages.where("folder_id is NULL").order(:name).all
		@total_pages = current_site.pages.count
		@total_folders = current_site.folders.count
		clear_log_prefix
	end

	def new
		@page = current_site.pages.new
	end

	def create
		@page = current_site.pages.build(params[:page])

		if @page.save
			if params[:page][:start_page].to_i == 1
				logger.info "PagesController::create - The Start page has been specified"
				logger.info "PagesController::create - #{@page.inspect}"
				@page.site.start_page = @page
				@page.site.save
			end
			flash.now[:success] = "Successfully created page."
			redirect_to edit_page_path(@page) and return
		else
			render :action => 'new'
		end
	end

	def edit
		@page = current_site.pages.find(params[:id])
		if params[:version_id]
			#@page.revert_to! params[:version_id]
			@version = @page.versions.find(params[:version_id])
			@page.content = @version.content
			@page.name = @version.name
			@page.filename = @version.filename
			@page.title = @version.title
			@page.page_template_id = @version.page_template_id
			@page.folder_id = @version.folder_id
			flash.now[:warning] = "Reverting to version #{@version.version}. NOTE: This is not saved yet, please click Save if you are happy to go back to this page."
		end

		if !@page.site.nil? && @page.site.start_page_id == @page.id
			@page.start_page = 1
		end
		
		@page.final_content = @page.content
		handle_links @page
		@page.content = @page.final_content
		
		respond_to do |format|
			format.html
			format.js {render :layout => false}
		end
	end

	def update
		@page = current_site.pages.find(params[:id])
		logger.info "Admin::PagesController::update - Attempting to update the page"
		if params[:page][:start_page].to_i == 1
			logger.info "The Start page has been specified"
			@page.site.start_page_id = @page.id
			@result = @page.site.save
		end

		if @page.update_attributes(params[:page])
			flash.now[:success] = "Successfully updated page."
			render :action => 'edit'
		else
			render :action => 'edit'
		end
	end
	
	def preview
		if params[:page].nil?
			flash.now[:error] = "Previewing new pages is not supported"
			redirect_to pages_url and return
		end
		@page = current_site.pages.new(params[:page])
		@page.site = current_site
		@site = current_site
		
		unless @page.page_template.nil?
		  @page.page_template = PageTemplate.find(@page.page_template_id)
		end
		@page.content = params[:page][:content]
		
		render_page @page and return
	end

	def destroy
		@page = current_site.pages.find(params[:id])
		@page.destroy
		flash.now[:success] = "Successfully destroyed page."
		redirect_to pages_url
	end

	# Testing an ajax response
	def test
		respond_to do |format|
			format.js
		 end
	end

	def sort
		parent = params[:parent]
		if !parent.nil?
			parent = parent.sub(/sort_f/, '')
		end
		logger.info "Now ParentID is #{parent}"
		if /[0-9]/.match(parent)
			set_parent(parent, params['sort'])
		else
			set_parent(nil, params['sort'])
		end
		render :nothing => true
	end

	def set_parent(parent, sort)
		position = 0
		sort.each do |element|

			if /p[0-9]+/.match(element)
				page_id = element.sub(/[p]/, '')
				Page.update(page_id, {:folder_id => parent})
			elsif /f[0-9]+/.match(element)
				folder_id = element.sub(/[f]/, '')
				Folder.update(folder_id, {:parent_id => parent})
			else
				logger.error "Problem matching the sort passed in by the sorter"
			end
		end
	end
	
	def links_iframe
		@funcNum  = params[:CKEditorFuncNum]
		@CKEditor = params[:CKEditor]
		@langCode = params[:langCode]

		session[:CKEditorFuncNum] = @funcNum
		session[:CKEditor] = @CKEditor
		session[:langCode] = @langCode
		logger.info "funcNum = #{@funcNum}"
	end
	
	def links
		@funcNum  = params[:CKEditorFuncNum]
		@CKEditor = params[:CKEditor]
		@langCode = params[:langCode]
		logger.info "funcNum = #{@funcNum}"
	end
	
	private
	
	private
	def choose_layout
		if [ 'preview' ].include? action_name
			'display'
		elsif ['links'].include? action_name
		  'basic'
		else
			'admin'
		end
	end

end
