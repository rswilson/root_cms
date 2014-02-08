class Admin::FoldersController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
			
	def index
		logger.info "Admin:FoldersController::index - Displaying folder index"
		@folders = Folder.order("name").all
		@root_folders = Folder.where("parent_id is null").order("name").all
		@referring_page = "folder"
	end

	def new
		logger.info "Admin:FoldersController::new - New folder page"
		@folder = Folder.new
		@folders = Folder.all(:order => "name").sort_by {|u| u.path.downcase}
	end

	def create
		logger.info "Admin:FoldersController::create - Creating new folder"
		@folder = Folder.new(params[:folder])
		if @folder.save
			logger.info "Admin:FoldersController::create - Successfully created folder: folder_id #{@folder.id}"
			flash[:success] = "Successfully created folder."
			redirect_to folders_path
		else
			logger.info "Admin:FoldersController::create - Failed to create folder"
			@folders = Folder.all(:order => "name").sort_by {|u| u.path.downcase}
			render :action => 'new'
		end
	end

	def edit
		logger.info "Admin:FoldersController::edit - Editing folder: #{params[:id]}"
		@folder = Folder.find(params[:id])
		@folders = Folder.all(:order => "name",:conditions => ["id != ?", @folder.id]).sort_by {|u| u.path.downcase}
		@referring_page = params[:referring_page]
	end

	def update
		logger.info "Admin:FoldersController::update - Updating folder: #{params[:id]}"
		@folder = Folder.find(params[:id])
		if @folder.update_attributes(params[:folder])
			logger.info "Admin:FoldersController::update - Successfully updated folder: #{@folder.id}"
			flash[:success] = "Successfully updated folder."
						if params[:referring_page] == "folder"
				redirect_to folders_path
			else
				redirect_to pages_path
			end
		else
			logger.info "Admin:FoldersController::update - Failed to update folder: #{params[:id]}"
			@folders = Folder.all(:order => "name",:conditions => ["id != ?", @folder.id]).sort_by {|u| u.path.downcase}
			render :action => 'edit'
		end
	end

	def destroy
		logger.info "Admin:FoldersController::destroy - Destroying folder: #{params[:id]}"
		@folder = Folder.find(params[:id])
		
		logger.info "Admin:FoldersController::destroy - Folder has #{@folder.sub_folders.count} sub_folders to correct"
		for sub_folder in @folder.sub_folders do
			logger.info "Admin:FoldersController::destroy - Updating #{sub_folder.id} to new parent #{@folder.parent_id}"
			sub_folder.update_attributes(:parent_id => @folder.parent_id)
		end
		
		logger.info "Admin:FoldersController::destroy - Folder has #{@folder.pages.count} pages to correct"
		for page in @folder.pages do
			logger.info "Admin:FoldersController::destroy - Updating #{page.id} to new folder #{@folder.parent_id}"
			page.update_attributes(:folder_id => @folder.parent_id)
		end
		
		@folder.destroy
		logger.info "Admin:FoldersController::destroy - Successfully destroyed folder."
		flash[:success] = "Successfully destroyed folder."
		redirect_to folders_url
	end

	# Sort the menu item based on JSON input
	#json_input = '[{"id":13},{"id":1,"children":[{"id":21},{"id":24},{"id":14},{"id":15},{"id":23}]},{"id":2,"children":[{"id":20},{"id":18},{"id":19}]},{"id":17},{"id":16,"children":[{"id":3,"children":[{"id":7,"children":[{"id":8}]},{"id":11},{"id":12},{"id":22}]}]},{"id":5,"children":[{"id":6}]}]'
	def sort
		logger.info "Admin:FoldersController::sort - Sorting folders"
		json_input = params[:sorted_folders]		
		folders = JSON.parse(json_input)
		update_folders(nil, folders)
		render :nothing => true
	end
		
	def update_folders(parent, folders)
		logger.info "Admin:FoldersController::update_folders: #{folders} and parent: #{parent}"
		for folder in folders do
			logger.info "Admin:FoldersController::update_folders: Updating folder #{folder['id']} with parent id #{parent}"
			Folder.update(folder['id'], {:parent_id => parent})
			unless folder["children"].nil?
				update_folders(folder["id"], folder["children"])
			end
		end
	end
end
