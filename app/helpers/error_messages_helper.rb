module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= "Invalid Fields"
    options[:message] ||= "Correct the following errors and try again."
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag(:div, :class => "error_messages alert alert-error") do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        content_tag(:button, "x", :class => "close", "data-dismiss" => "alert", "type" => "button") + content_tag(:h4, options[:header_message]) + content_tag(:p, options[:message]) + content_tag(:ul, list_items.join.html_safe)
      end
    end
  end
  
  def render_form_element(f, element_name, type, errors, options)
  	logger.info "Rendering #{f}"
    render :partial => "/admin/partials/form_element", :locals => {:f => f, :name => element_name, :type => type, :errors => errors, :style => options[:style], :dropdown => options[:dropdown] , :label_text => options[:label_text], :rows => options[:rows]}
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
    
    def form_element(f, element_name, type, errors, options = {})
			options.reverse_merge! :dropdown => nil, :style => nil, :label_text => nil, :rows => 10
			unless options[:dropdown].nil?
				if options[:dropdown][:include_blank].nil?
					options[:dropdown][:include_blank] = false
				end
			end

			@template.render_form_element(f, element_name, type, errors, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
