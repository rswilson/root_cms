class Display::PostsController < ApplicationController
	before_filter :get_blog
	layout "display"
	def get_blog
		@blog = Blog.find(params[:blog_id])
	end

	def show
		@page = Page.new
		@page.content = "#POST#{params[:id]}#"
		@full_length = true
		@page.page_template = @blog.page_template
		
		@post = Post.find(params[:id])
		unless @post.nil?
			@page.title = "#{@page.title }#{@post.title}"
		end
		
		@page = render_page @page
	end
end
