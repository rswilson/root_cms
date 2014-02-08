class Admin::MenusController < ApplicationController
	layout "admin"
	before_filter :check_logged_in

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params[:menu])
    if @menu.save
      flash[:success] = "Successfully created menu."
      redirect_to edit_menu_path(@menu)
    else
      render :action => 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
		#@menu_item = MenuItem.new(:menu_id => params[:id])
		@menu_item = @menu.menu_items.new
		puts @menu_item.menu_id
		respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      flash[:success] = "Successfully updated menu."
      redirect_to edit_menu_path(@menu)
    else
			flash[:success] = "Problem updating the menu. Your changes were not saved."
      redirect_to edit_menu_path(@menu)
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:success] = "Successfully destroyed menu."
    redirect_to menus_url
  end
end
