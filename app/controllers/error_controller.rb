class ErrorController < ApplicationController
	# Display a message when the user goes to domain.com/ but there is no start page defined	
	def no_start_page
		logger.error "ErrorController::no_start_page - No start page defined. Rendering error page."
	end

	# Display when a user tries to go to a page that doesn't exist
	def page_not_found
		logger.error "ErrorController::page_not_found - Page not found for #{params[:path]}. Rendering error page."
	end
end
