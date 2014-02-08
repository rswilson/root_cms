class Display::BlogsController < ApplicationController
	layout "display"
	def show
		@blog = Blog.find(params[:id])
		if params[:page].nil?
			@posts = @blog.posts.order(:id).page 1
		else
			@posts = @blog.posts.order(:id).page params[:page]
		end
		@page = Page.new
		@page.content = (render_to_string :partial => "/display/blogs/show", :locals => {:blog => @blog})
		@full_length = true
		@page.page_template = @blog.page_template
		
		unless @blog.nil?
			@page.title = "#{@page.title}#{@blog.name}"
		end
		
		@page = render_page @page
	end

end
