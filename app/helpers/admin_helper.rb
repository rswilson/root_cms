module AdminHelper
	def get_bread_crumb(url)
		begin
		  breadcrumb = ''
		  sofar = '/'
		  elements = url.split('/')
		  breadcrumb += "<a href='/admin'>Home</a>"
		  for i in 1...elements.size
		    sofar += elements[i] + '/'
		    if i%2 != 0
		      begin
		      	logger.info elements[i - 1].singularize.camelize
		        #breadcrumb += "<a href='#{sofar}'>"  + eval("#{elements[i - 1].singularize.camelize}.find(#{elements[i]}).name").to_s + '</a>'
		      rescue
		        #breadcrumb += elements[i]
		      end
		    else
		      breadcrumb += "<a href='#{sofar}'>#{elements[i].pluralize}</a>"
		      breadcrumb += ' -> ' if i != elements.size - 1
		    end
		    #breadcrumb += ' -> ' if i != elements.size - 1
		  end
		  breadcrumb
		rescue
		  'Not available'
		end
	end
end
