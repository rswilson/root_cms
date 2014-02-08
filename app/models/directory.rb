# A model to represent a directory on the server
# This includes all sub-directories and files under this level
# Call populate with the path you want to start from and it will do the rest
class Directory
	attr_accessor :directories, :files, :name, :path

	# Takes the current directory that you wish to respresent
	# It will then creates all the directories and files underneath this directory
	def populate(level)
		initialize
		self.name = level
		self.path = "#{self.path}/#{level}"

		Dir.new(base_dir = "#{self.path}").each do |name|
		path = "#{base_dir}/#{name}"
			if name !~ /^\./
				if FileTest.directory?(path)
					temp_dir = Directory.new
					temp_dir.populate("#{level}/#{name}")
					self.directories << temp_dir
				else
					self.files << name
				end
			end
		end
	end

	def initialize(params = nil)
		self.directories = Array.new
		self.files = Array.new
		self.path = Dir.pwd
	end

	def all_directories
		all = Array.new
		all << self.name
		for directory in self.directories
			for result in directory.all_directories
				all << result
			end
		end
		return all
	end

	def all_directories_bar_root
		all = Array.new
		for directory in self.directories
			for result in directory.all_directories
				all << result
			end
		end
		return all
	end

	def print
		for dir in self.directories
			dir.print
		end
		for file in self.files
		end
	end

	def to_s
		return self.name.gsub(/\//, "--")
	end
	
	def path_without_root
		return self.path.gsub(Rails.root.to_s, "")
	end
end
