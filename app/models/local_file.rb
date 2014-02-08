# Represents a file on the server
class LocalFile
	attr_accessor :name,:size, :mtime, :path

	def initialize(path)
		self.mtime = ""
		self.size = ""
		self.name = "No file"
		self.path = path
		if File.new(path, "r")
			self.name = File.basename(path)
			self.mtime =  File.mtime(path)
			self.size = File.size(path)
		end
	end
	
	def model_name
	  return "nil"
  end

	def escape_path
		(self.path.gsub(/\//, "%2F")).gsub(/\./, "&#46;")
	end

	def new_path(filename)
			@last_position = self.path.rindex("/");
			@new_path = self.path
			if @last_position > 0
				@new_path = self.path[0,@last_position]
			end
			@new_path = "#{@new_path}/#{filename}"
	end

	def rename(filename)
		#logger.info "Renaming file from #{self.path} to #{new_path(filename)}"
		File.rename(self.path, new_path(filename))
	end

end
