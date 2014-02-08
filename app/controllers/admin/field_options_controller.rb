class Admin::FieldOptionsController < ApplicationController
	layout "admin"
	before_filter :check_logged_in
	before_filter :get_field

	def get_field
		@field = Field.find(params[:field_id])
	end

	def create
		logger.info "Admin:FieldOptionsController::create - Creating Field Option"
		@field_option =  @field.field_options.new(params[:field_option])
		respond_to do |format|
			if @field_option.save
				@field.save
				@field_option =  @field.field_options.new
				logger.info "Admin:FieldOptionsController::create - Field Option Created Successfully: field_option_id #{@field_option.id}"
				format.html { redirect_to(edit_form_path(@field.form), :success => 'Successfully created field option.') }
				format.js {render "/admin/field_options/ajax/create"}
			else
				logger.info "Admin:FieldOptionsController::create - Field Option failed to create"
				format.html { render :action => "new" }
			end
		end
	end

	def update
		logger.info "Admin:FieldOptionsController::update - Updating field option: field_option_id #{params[:id]}"
		@field_option =  @field.field_options.find(params[:id])
		if @field_option.update_attributes(params[:field_option])
			logger.info "Admin:FieldOptionsController::update - Field Option updated successfully: field_option_id #{@field_option.id}"
			flash[:success] = "Successfully updated field options."
			redirect_to @field_options
		else
			logger.info "Admin:FieldOptionsController::update - Failed to update field option: field_option_id #{params[:id]}"
			render :action => 'edit'
		end
	end

	def destroy
		logger.info "Admin:FieldOptionsController::destroy - Destroying field option: field_option_id #{params[:id]}"
		@field_option =  @field.field_options.find(params[:id])
		@field_option.destroy
		@field_option = @field.field_options.new
		logger.info "Admin:FieldOptionsController::destroy - Successfully destroyed field option: field_option_id #{params[:id]}"
		flash[:success] = "Successfully destroy field option."
		respond_to do |format|
			format.html { redirect_to field_options_url }
			format.js {render "/admin/field_options/ajax/destroy"}
		end
	end
end
