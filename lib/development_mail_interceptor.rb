class DevelopmentMailInterceptor
	def self.delivering_email(message)
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!is this working"
		message.subject = "#{message.to} ---- #{message.subject}"
		message.to = "rswilsonuk@gmail.com"
	end
end
