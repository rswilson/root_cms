class Admin::SitesController < ApplicationController
	layout :choose_layout

	def index
		@site = Site.first

		if @site.nil?
			redirect_to new_site_url
		else
			render :action => "edit"
		end
	end

	def show
		@site = Site.find(params[:id])
	end

	def new
		@site = Site.first

		if !@site.nil?
			flash[:success] = "Site already exists!"
			redirect_to :controller => '/admin' and return
		end

		@site = Site.new
		@user = User.new
	end

	def create
		@site = Site.new(params[:site])
		@user = User.new(params[:user])
		ActiveRecord::Base.transaction do
			@save_result = @site.save & @user.save
			logger.info "Did we manage to save correctly? #{@save_result}"
			if !@save_result
				raise ActiveRecord::Rollback
			end
		end
		if @save_result
			flash[:success] = "Successfully created site."
			redirect_to login_path
		else
			render :action => 'new'
		end
	end

	def edit
		@site = Site.find(params[:id])
	end

	def update
		@site = Site.find(params[:id])
		if @site.update_attributes(params[:site])
			flash.now[:success] = "Successfully updated site."
			render :template => '/admin/index'
		else
			render :action => 'edit'
		end
	end

	def destroy
		@site = Site.find(params[:id])
		@site.destroy
		flash[:success] = "Successfully destroyed site."
		redirect_to sites_url
	end

	private
	def choose_layout
	if [ 'new', 'create' ].include? action_name
		'sign_up'
	else
		'admin'
		end
	end
end
