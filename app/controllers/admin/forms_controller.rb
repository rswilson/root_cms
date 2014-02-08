class Admin::FormsController < ApplicationController
	layout :choose_layout
	before_filter :check_logged_in

	def index
		@forms = Form.all
	end

	def show
		@form = Form.find(params[:id])
	end

	def new
		@form = Form.new
	end

	def create
		@form = Form.new(params[:form])
		if @form.save
			flash[:success] = "Successfully created form."
			redirect_to edit_form_path(@form)
		else
			render :action => 'new'
		end
	end

	def edit
		@form = Form.find(params[:id])
		logger.info "Got lots of fields! #{@form.fields.count}"
	end

	def update
		@form = Form.find(params[:id])
		if @form.update_attributes(params[:form])
			flash[:success] = "Successfully updated form."
			render :action => 'edit'
		else
			render :action => 'edit'
		end
	end

	def destroy
		@form = Form.find(params[:id])
		@form.destroy
		flash[:success] = "Successfully destroyed form."
		redirect_to forms_url
	end
	
	private
	def choose_layout
		if [ 'index' ].include? action_name
			'admin'
		elsif [ 'new' ].include? action_name
		  'admin'
		else
			'admin_three_column'
		end
	end
end
