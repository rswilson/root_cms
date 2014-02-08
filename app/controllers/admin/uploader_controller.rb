class Admin::UploaderController < ApplicationController
	layout "none"
	before_filter :check_logged_in
	
	def albums
	  @gallery = Gallery.find(params[:gallery_id])
		@albums = @gallery.albums

		logger.info "rwilson: what is my format? Albums size is #{@albums.size}"
		
		respond_to do |format|
		  format.js {render "/admin/pictures/uploader/ajax/albums"}
		end
	end
	
	def album
		@album = Album.find(params[:album_id])
		respond_to do |format|
			format.js {render "/admin/pictures/uploader/ajax/album"}
		end
	end

end
