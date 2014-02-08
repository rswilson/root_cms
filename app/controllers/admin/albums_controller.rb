class Admin::AlbumsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_gallery

	def get_gallery
		@gallery = Gallery.find(params[:gallery_id])
	end

	def new
		logger.info "Admin:AlbumsController::index - New Album page"
		@album = @gallery.albums.new
		@galleries = Gallery.all
	end

	def create
		logger.info "Admin:AlbumsController::create - Creating album"
		@album = @gallery.albums.new(params[:album])
		if @album.save
			logger.info "Admin:AlbumsController::create - Successfully created album: album_id #{@album.id}"
			flash[:success] = "Successfully created album."
			redirect_to edit_gallery_album_path(@album.gallery, @album)
		else
			logger.info "Admin:AlbumsController::create - Error when saving album"
			@picture = @album.pictures.new
			@galleries = Gallery.all
			render :action => 'new'
		end
	end

	def edit
		logger.info "Admin:AlbumsController::edit - Editing album: album_id #{params[:id]}"
		@album = @gallery.albums.find(params[:id])
		@picture = @album.pictures.new
		@galleries = Gallery.all	
	end

	def update
		logger.info "Admin:AlbumsController::update - Updating album: album_id #{params[:id]}"
		@album = @gallery.albums.find(params[:id])
		if @album.update_attributes(params[:album])
			logger.info "Admin:AlbumsController::update - Successfully updated album: album_id #{@album.id}"
			flash[:success] = "Successfully updated album."
			redirect_to edit_gallery_album_path(@album.gallery, @album)
		else
			logger.info "Admin:AlbumsController::update - Error updating album"
			@picture = @album.pictures.new
			@galleries = Gallery.all
			render :action => 'edit'
		end
	end

	def destroy
		logger.info "Admin:AlbumsController::destroy - Destroying album: album_id #{params[:id]}"
		@album = @gallery.albums.find(params[:id])
		@album.destroy
		logger.info "Admin:AlbumsController::destroy - Successfully destroyed album: album_id #{params[:id]}"
		flash[:success] = "Successfully destroyed album."
		redirect_to edit_gallery_path(@gallery)
	end
end
