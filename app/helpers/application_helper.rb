# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def show_flash(page)
		puts "Flash is: #{flash[:success]}"
		if !flash[:success].nil?
			page[:flash_message].show
			page.replace_html :flash_message, content_tag(:div, flash[:success], :id => "flash_notice")
			page.delay(1) do
				page[:flash_notice].fade
			end
			flash.discard
		else
			page[:flash_message].empty
		end
	end
	
	def coderay(text)  
		text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
			CodeRay.scan($3, $2).div(:css => :class)
		end
	end
end
