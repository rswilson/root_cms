class Admin::GalleriesController < ApplicationController
	layout "admin"

	before_filter :check_logged_in

	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.new(params[:gallery])
		if @gallery.save
			flash[:success] = "Successfully created gallery."
			redirect_to edit_gallery_path(@gallery)
		else
			render :action => 'new'
		end
	end

	def edit
		@gallery = Gallery.find(params[:id])
		@albums = @gallery.albums
	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update_attributes(params[:gallery])
			flash[:success] = "Successfully updated gallery."
			redirect_to edit_gallery_path(@gallery)
		else
			@albums = @gallery.albums
			render :action => 'edit'
		end
	end
	
	def list
	  @gallery = Gallery.find(params[:id])
		@albums = @gallery.albums
  end

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		flash[:success] = "Successfully destroyed gallery."
		redirect_to galleries_url
	end
end
