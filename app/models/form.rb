class Form < ActiveRecord::Base
	attr_accessible :name, :description, :notification_address, :send_notification, :submission_message, :submit_button

	has_many :fields, :dependent => :destroy
	has_many :form_submissions, :dependent => :destroy

	validates_presence_of :name
	#validates_inclusion_of :send_notification
	validate :check_notification_address?
	
	def check_notification_address?
		#RAILS_DEFAULT_LOGGER.info "Checking notification address before saving"
		if self.send_notification && self.notification_address == ""
			#RAILS_DEFAULT_LOGGER.info "No notification address found"
			errors.add("notification_address", "You have not a notification address yet you want a notification to be sent")
		end
	end
	
	def submit_text
		self.submit_button || "Submit"
	end
end
