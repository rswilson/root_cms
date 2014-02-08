class FormSubmissionField < ActiveRecord::Base
	#include ActiveModel::Validations
	extend ActiveModel::Translation

	#class ValueValidator < ActiveModel::EachValidator
	#	def validate_each(object, attribute, value)
	#		puts "LALALALALAL #{object} #{object.field} #{object.field_id}"
	#		if object.field.required
	#			if object.value.nil? || object.value == ""
	#				object.errors[attribute] << (options[:message] || "is not formatted properly")
	#			end
	#		end
	#	end
	#end

	attr_accessible :name, :value, :field_id, :form_submission_id

	belongs_to :form_submission
	belongs_to :field

#	validates :value, :value => true
	#validates_presence_of :value, :if => :required
	
	validates :value, :presence => { :if => :required, :message => " cannot be empty." }
	
	def required
	  logger.info "Checking if #{self.plain_label} is required: #{self.field.required}"
	  return self.field.required
	end

	#def initialize(attributes = {})
		#for attr in attributes do
		#	puts "#{attr}"
		#end
	#end
	
	#def initialize(field_id)
	#	super
	#	self.field_id = field_id unless field_id.nil?
	#end

	def label
	  if !self.field.label_string.nil?
		  return self.field.label_string
		end
		return ""
	end
	
	def plain_label
	    return self.field.plain_label
  end

end
