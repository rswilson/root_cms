class FieldOption < ActiveRecord::Base
	attr_accessible :value, :field_id
	belongs_to :field

	validates_presence_of :value, :field_id
end
