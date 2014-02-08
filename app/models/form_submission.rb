class FormSubmission < ActiveRecord::Base
	attr_accessible :viewed, :form_id, :form_submission_fields_attributes

	belongs_to :form
	has_many :form_submission_fields, :dependent => :destroy
	accepts_nested_attributes_for :form_submission_fields, :allow_destroy => true

	def get_errors
		@errors = Array.new
		for field in form_submission_fields do
			if field.errors.any?
			  for error in field.errors do
				  @errors << {:error_message => error.to_s, :field => field}
				end
			end
		end
		logger.info "Got the errors: #{@errors.size}"
		return @errors
	end

	def errors_count
		num_errors = 0
		@errors = self.get_errors
		for field_errors in @errors
			num_errors += field_errors
		end
		return num_errors
	end
end
