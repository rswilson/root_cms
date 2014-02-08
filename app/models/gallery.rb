class Gallery < ActiveRecord::Base
	attr_accessible :name, :description

	has_many :albums, :dependent => :destroy

	validates_presence_of :name
end
