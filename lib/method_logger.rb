module MethodLogger
  def self.included(base)
    methods = base.instance_methods(false) + base.private_instance_methods(false)
    base.class_eval do
      methods.each do |method_name|
        original_method = instance_method(method_name)
        define_method(method_name) do |*args, &block|
          logger.info "LOG ME!!!!-> #{base}##{method_name}(#{args.inspect})"
          return_value = original_method.bind(self).call(*args, &block)
          logger.info "<- #{base}##{method_name} #=> #{return_value.inspect}"
          return_value
        end
      end
    end
  end
end
