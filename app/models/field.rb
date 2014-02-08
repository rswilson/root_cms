class Field < ActiveRecord::Base
	attr_accessible :name, :label, :type, :position, :default_value, :number_of_selections, :required

	belongs_to :form
	has_many :field_options, :dependent => :destroy
	has_many :form_submission_fields
	
	validates_presence_of :name, :type
	validates_uniqueness_of :name, :scope => [:form_id]

  def generate_name
    if self.name.nil?
      self.name = "Field #{self.form.fields.count}"
    end
  end

	def label_string
		return_string = self.plain_label

		if self.required
			return_string += " *"
		end
		return return_string
	end
	
	def plain_label
		return_string = ""
		if !self.label.nil? && self.label != ""
			return_string = self.label
		elsif !self.name.nil? && self.name != ""
			return_string = self.name
		else
			return_string = "Label"
		end
		return return_string
	end

	def has_field_options?
		return false
	end
end
