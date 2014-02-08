class Admin::PicturesController < ApplicationController
	layout :choose_layout
	before_filter :check_logged_in
	before_filter :get_album, :except => [:uploader, :uploader_iframe]

	def get_album
		@album = Album.find(params[:album_id])
	end

	def index
		@pictures = @album.pictures.all
	end

	def new
		@picture = @albums.pictures.new
	end

	def create
		@picture = @album.pictures.build(params[:picture])
		if @picture.save
			flash[:success] = "Successfully created picture."
			@album = @picture.album
			
			if params[:uploader]
				logger.warn "Uploader"
			end
			
			logger.warn "#{params[:uploader]}"
			
			if params[:uploader]
				logger.info "Rendering"
				redirect_to "#{params[:redirect_url]}" and return
			else
				redirect_to edit_gallery_album_path(@picture.album.gallery, @picture.album)
			end
		else
			@album = @picture.album
			@gallery = @album.gallery
			@galleries = Gallery.all
			if params[:uploader]
				logger.info "Rendering"
				redirect_to "#{params[:redirect_url]}" and return
			else
				render 'admin/albums/edit'
			end
		end
	end

	def edit
		@picture = @album.pictures.find(params[:id])
	end

	def update
		@picture = @album.pictures.find(params[:id])
		if @picture.update_attributes(params[:picture])
			flash[:success] = "Successfully updated picture."
			redirect_to edit_gallery_album_picture_path(@picture.album.gallery, @picture.album.id, @picture)
		else
			redirect_to edit_gallery_album_picture_path(@picture.album.gallery, @picture.album.id, @picture)
		end
	end

	def destroy
		@picture = @album.pictures.find(params[:id])
		@picture.destroy
		flash[:success] = "Successfully destroyed picture."
		
		if params[:redirect_url]
			redirect_to "#{params[:redirect_url]}" and return
		else
			redirect_to edit_gallery_album_path(@album.gallery, @album)
		end
	end

	def rotate
		@picture = Picture.find(params[:picture_id])
		rotation = params[:degrees].to_f
		logger.info "!!!! ROTATING"
		rotation ||= 90 # Optional, otherwise, check for nil!

		if rotation == 0
			rotation = 90
		end

		@picture.rotate!(rotation)

		if @picture.save
			flash[:success] = "The image has been rotated"
			if params[:parent_page] == "album"
				redirect_to edit_gallery_album_path(@album.gallery, @picture.album.id)
			elsif params[:redirect_url]
				redirect_to "#{params[:redirect_url]}" and return
			else
				redirect_to edit_gallery_album_picture_path(@album.gallery, @picture.album.id, @picture)
			end
		else
			if params[:parent_page] == "album"
				redirect_to edit_gallery_album_path(@album.gallery, @picture.album.id)
			elsif params[:redirect_url]
				redirect_to "#{params[:redirect_url]}" and return
			else
				redirect_to edit_gallery_album_picture_path(@album.gallery, @picture.album.id, @picture)
			end
		end
	end

	def uploader_iframe
		@funcNum  = params[:CKEditorFuncNum]
		@CKEditor = params[:CKEditor]
		@langCode = params[:langCode]

		session[:CKEditorFuncNum] = @funcNum
		session[:CKEditor] = @CKEditor
		session[:langCode] = @langCode
		logger.info "funcNum = #{@funcNum}"
	end
	
	def uploader
		#@funcNum  = session[:CKEditorFuncNum]
		#@CKEditor = session[:CKEditor]
		#@langCode = session[:langCode]
		@funcNum  = params[:CKEditorFuncNum]
		@CKEditor = params[:CKEditor]
		@langCode = params[:langCode]
		logger.info "funcNum = #{@funcNum}"
		
	
		@album = Album.find_by_name("Uploads")
		
		if @album.nil?
		  @gallery = Gallery.find_by_name("Uploads")
		  if @gallery.nil?
		    @gallery = Gallery.new
		    @gallery.name = "Uploads"
		    @gallery.save
	    end
	    @album = @gallery.albums.new
	    @album.name = "Uploads"
	    @album.save
	  end
		
		@picture = @album.pictures.new
		#@pictures =  @album.pictures.order("created_at desc").all
		@pictures = Picture.find(:all, :order => "created_at desc", :limit => 5)
	end
	
	private
	def choose_layout
	if [ 'uploader', 'uploader_iframe' ].include? action_name
		'basic'
	else
		'admin'
		end
	end
end
