class Admin::UsersController < ApplicationController
	layout :choose_layout

	before_filter :check_logged_in
	before_filter :login_required, :except => [:new, :create]

	def new
		@user = User.new
	end
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		# If we are already logged in, then we have simply created one in admin
		if @user.save
			if logged_in?
				flash[:success] = "User #{@user.username} created."		
				redirect_to edit_user_path(@user)	
			else
				flash[:success] = "Thank you for signing up! You are now logged in."
				session[:user_id] = @user.id
				redirect_to "/"
			end
		else
			render :action => 'new'
		end
	end
	

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Successfully updated user."
			redirect_to edit_user_path(@user)
		else
			render :action => 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "Successfully destroyed user."
		redirect_to users_url
	end
	
	private
	def choose_layout
		if [ 'login' ].include? action_name
			'sign_up'
		else
			'admin'
		end
	end
end
