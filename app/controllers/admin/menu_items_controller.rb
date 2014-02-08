class Admin::MenuItemsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_menu

	def get_menu
		@menu = Menu.find(params[:menu_id])
	end
	
	cache_sweeper :site_sweeper, :only => [:create, :update, :destroy]

	def index
		@menu_items = MenuItem.all(:order => "position")
	end

	def show
		@menu_item = MenuItem.find(params[:id])
	end

	def new
		@menu_item = MenuItem.new
	end

	def create
		logger.info "Admin:MenuItemsController::create - Creating menu_item"
		@menu_item = @menu.menu_items.new(params[:menu_item])
		
		if @menu_item.position.nil?
			@menu_item.position = @menu.menu_items.length
		end
		
		
		if @menu_item.save
			logger.info "Admin:MenuItemsController::create - Successfully created menu_item: menu_item_id #{@menu_item.id}"
			flash[:success] = "Successfully created menu_item."
			#redirect_to edit_menu_menu_item_path(@menu_item.menu, @menu_item)
			redirect_to edit_menu_path(@menu)
		else
			logger.info "Admin:MenuItemController::create - Error when saving menu_item"
			render 'admin/menus/edit'
		end
	end


	def edit
		@menu_item = MenuItem.find(params[:id])
	end

	def update
		@menu_item = MenuItem.find(params[:id])
		if @menu_item.update_attributes(params[:menu_item])
			flash[:success] = "Successfully updated menu item."
			redirect_to edit_menu_path(@menu_item.menu)
		else
			render :action => 'edit'
		end
	end

	def destroy
		@menu_item = MenuItem.find(params[:id])
		@menu = @menu_item.menu
		@menu_item.destroy
		flash[:success] = "Successfully destroyed menu item."
		redirect_to edit_menu_path(@menu)
	end
	
	# Sort the menu item based on JSON input
	#json_input = '[{"id":13},{"id":1,"children":[{"id":21},{"id":24},{"id":14},{"id":15},{"id":23}]},{"id":2,"children":[{"id":20},{"id":18},{"id":19}]},{"id":17},{"id":16,"children":[{"id":3,"children":[{"id":7,"children":[{"id":8}]},{"id":11},{"id":12},{"id":22}]}]},{"id":5,"children":[{"id":6}]}]'
	def sort
		json_input = params[:menu]		
		menu = JSON.parse(json_input)
		update_menu(nil, menu, 0)
		render :nothing => true
	end
		
	def update_menu(parent, menu_items, position)
		puts "#{menu_items} and parent: #{parent}"
		for menu_item in menu_items do
			#puts "This is the damn: #{menu_item}"
			puts "Updating menu_item #{menu_item['id']} with position #{position} and parent id #{parent}"
			MenuItem.update(menu_item['id'], {:position => position.to_i + 1, :parent_id => parent})
			unless menu_item["children"].nil?
				update_menu(menu_item["id"], menu_item["children"], 0)
			end
			position += 1
		end
	end
	
	# Depracated for now
	# Essentially shifts a menu item up one position in the menu and
	# shuffles the rest of the menu items to match the new ordering
	def move_up
		@menu_item = MenuItem.find(params[:id])
		if @menu_item.parent_id.nil?
			if @menu_item.display_order > 0
				@menu_item.display_order -= 1
				@item_to_swap = MenuItem.where("display_order = ? AND parent_id is NULL", @menu_item.display_order).first
				@item_to_swap.display_order += 1

				if @menu_item.save && @item_to_swap.save
					flash[:success] = "Successfully updated menu item."
				end
			end
		else
			@menu_item.parent_id = @menu_item.parent.parent_id
			@menu_item.display_order = @menu_item.parent.display_order + 1
			@items_to_move = MenuItem.where("display_order >= ? AND parent_id = ?", @menu_item.display_order, @menu_item.parent_id).all

			for item in @items_to_move do
				item.display_order += 1
				item.save
			end
			if @menu_item.save
				flash[:success] = "Successfully updated menu item."
				redirect_to @menu_item.menu
			else
				render :action => 'edit'
			end
		end
	end

	# Depracated for now
	# Essentially shifts a menu item down one position in the menu and
	# shuffles the rest of the menu items to match the new ordering
	def move_down
		@menu_item = MenuItem.find(params[:id])
		if @menu_item.parent_id.nil?
			if @menu_item.display_order < @menu_item.menu.number_of_children
				@menu_item.display_order += 1
				@item_to_swap = MenuItem.where("display_order = ? AND parent_id is NULL", @menu_item.display_order).first
				@item_to_swap.display_order -= 1

				if @menu_item.save && @item_to_swap.save
					flash[:success] = "Successfully updated menu item."
				end
			end
		else
			render :action => 'edit'
		end
	end	
end
