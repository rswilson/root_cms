class Admin::FilesController < ApplicationController
	layout "admin"
	before_filter :check_logged_in

	# Get all the directory structure of the public/site_files directory and below
	def index
		logger.info "Admin::FilesController::index - Listing all files for: public/site_files"
		@root_directory = Directory.new
		@root_directory.populate("public/site_files")
	end

	# Upload the selected file to the site_files directory
	def upload
		logger.info "Admin::FilesController::upload - Uploading file: path: #{params[:path]} filename: #{params[:data].original_filename}"
		path = params[:path] + "/" + params[:data].original_filename
		root = "#{Rails.root}/"

		# Prevent overwritting an already existing file
		if Dir[root+path].length > 0 && params[:overwrite].nil?
				
			flash[:success] = "File already exists!"
			redirect_to :action => "index"
			return
		end
		data = params[:data].read
		upload_file(data, root+path)

		# TODO - Add proper checking to see if the file uploaded correctly
		#if @upload.save
			logger.info "Admin::FilesController::upload - File uploaded successfully"
			flash[:success] = "File was successfully uploaded."
		#else
			#flash[:success] = "Upload error!"
		#end

		redirect_to :action => 'index'
	end

	# Actually write the file to the server
	def upload_file(data, path)
		File.open(path, 'wb') do |f|
			f.write(data)
		end
	end

	# Create a new folder
	def make_folder
		logger.info "Admin::FilesController::make_folder - Creating folder: path: #{params[:path]} name: #{params[:folder_name]}"
		if params[:path] && params[:folder_name]
			path = params[:path]
			folder_name = params[:folder_name]
			logger.info "Admin::FilesController::make_folder - Attempting to make new folder: #{folder_name} at #{path}"
			if !path.to_s.include? Rails.root.to_s
				@path = "#{Rails.root}/#{path}/#{folder_name}"
				FileUtils.mkdir_p @path
				logger.info "Admin::FilesController::make_folder - Successfully created folder: #{folder_name} at #{path}"
				flash[:success] = "Folder #{folder_name} created successfully."
				redirect_to :action => 'index' and return
			else
				flash[:success] = "Invalid file PATH"
				redirect_to :action => 'index' and return
			end
		else
			logger.info "Admin::FilesController::make_folder - Invalid path and/or folder name: #{params[:path]} name: #{params[:folder_name]}"
			flash[:success] = "You have not specified the name of the folder or the path. Please try again."
			redirect_to :action => 'index' and return
		end
	end

	# Delete's a folder from the current site_files directory
	# TODO Extend the Rails.root check to include the site_files directory
	# to double ensure the user can't delete too much
	def delete_folder
		logger.info "Admin::FilesController::delete_folder - Deleting folder: #{params[:path]}"
		if params[:path]
			logger.info "Admin::FilesController::delete_folder - Attempting to remove #{params[:path]}"
			if !params[:path].include? Rails.root.to_s
				@path = "#{Rails.root}/#{params[:path]}"
				FileUtils.rm_r @path
				logger.info "Admin::FilesController::delete_folder - Successfully deleted folder: #{params[:path]}"
				flash[:success] = "Folder #{params[:path]} deleted successfully."
				redirect_to :action => 'index' and return
			else
				logger.info "Admin::FilesController::delete_folder - User tried to deleted a protected folder: #{params[:path]}"
				flash[:success] = "Invalid folder PATH"
				redirect_to :action => 'index' and return
			end
		else
			logger.info "Admin::FilesController::delete_folder - Path to folder not specified"
			flash[:success] = "You have not specified the path of your folder. Please try again."
			redirect_to :action => 'index' and return
		end
	end

	def edit
		logger.info "Admin::FilesController::edit - Editing file: #{params[:path]}"
		@file = LocalFile.new(params[:path])
	end

	# Rename the file, maybe this should be called "update"
	def update
		logger.info "Admin::FilesController::update - Renaming file: #{params[:file][:path]} to #{params[:file][:name]}"
		@file = LocalFile.new(params[:file][:path])
		@file.rename(params[:file][:name])
		flash[:success] = "File has been renamed to #{params[:file][:name]}"
		redirect_to :action => 'index'
	end

	def destroy
		logger.info "Admin::FilesController::destroy - This section needs to be improved for security purposes"

		# check url is in format {SITE_ROOT} so that the user can't
		# delete something they shouldn't be able to
		if params[:path].include? Rails.root.to_s
			logger.info "Admin::FilesController::destroy - Successfully deleted file: #{params[:path]}"
			File.delete(params[:path])
			flash[:success] = "File has been deleted."
		else
			logger.info "Admin::FilesController::destroy - User tried to delete something suspicious: #{params[:path]}"
			flash[:success] = "Naughty, I'm not deleting that!"
		end
		redirect_to files_url
	end
end
