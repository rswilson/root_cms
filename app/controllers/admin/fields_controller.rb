class Admin::FieldsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_form

	def get_form
		@form = Form.find(params[:form_id])
	end

	def create
		logger.info "Admin:FieldsController::create - Creating field"
		@field = @form.fields.new(params[:field])
		@field.generate_name
		respond_to do |format|
			if @field.save
				logger.info "Admin:FieldsController::create - Successfully created field: field_id #{@field.id}"
				format.html { redirect_to(edit_form_path(@form), :success => 'Form Field was successfully created.') }
				format.js {render "/admin/fields/ajax/create"}
			else
				logger.info "Admin:FieldsController::create - Failed to create field"
				format.html { render :action => "new" }
			end
		end
	end

	def edit
		logger.info "Admin:FieldsController::edit - Editing field: field_id #{params[:id]}"
		@field = @form.fields.find(params[:id])
		@field_option = @field.field_options.new
		respond_to do |format|
			format.js {render "/admin/fields/ajax/edit"}
		end
	end

	def update
		logger.info "Admin:FieldsController::update - Updating field: field_id #{params[:id]}"
		@field = @form.fields.find(params[:id])
		respond_to do |format|
			if @field.update_attributes(params[:field])
				logger.info "Admin:FieldsController::update - Successfully updated field: field_id #{@field.id}"
				format.html { redirect_to(edit_form_path(@form), :success => 'Field was successfully updated.') }
				format.js {render "/admin/fields/ajax/update"}
			else
				logger.info "Admin:FieldsController::update - Failed to update field: field_id #{params[:id]}"
				format.js {render "/admin/fields/ajax/update"}
			end
		end
	end

	def destroy
		logger.info "Admin:FieldsController::destroy - Destroying field: field_id #{params[:id]}"
		@field = @form.fields.find(params[:id])
		@field.destroy
		logger.info "Admin:FieldsController::destroy - Successfully destroyed field: field_id #{params[:id]}"
		flash[:success] = "Successfully destroyed field."
		respond_to do |format|
			format.html { redirect_to(forms_url) }
			format.js {render "/admin/fields/ajax/destroy"}
		end
	end
end
