# frozen_string_literal: true

module InvokedMethodReporter
  class Binder
    # Separate the namespace from the method name
    OBJECT_LEVEL_SEPARATOR = '#' # User#full_name
    CLASS_LEVEL_SEPARATOR  = '.' # User.find

    # method_definition is a string. Example: User#unused_method
    def self.bind_reporter_to(method_definition)
      new(method_definition).bind_reporter
    end

    # method_definition is a string. Example: User#unused_method
    def initialize(method_definition)
      @object_level_binding = method_definition.include?(OBJECT_LEVEL_SEPARATOR)

      @method_definition       = method_definition
      @namespace, @method_name = method_definition.split(separator)
    end

    def bind_reporter
      reporter = Reporter.new(@method_name, @method_definition)
      target_const.prepend(reporter)
    rescue StandardError => e
      error_message = "[InvokedMethodReporter] Can't watch #{@method_definition} because #{e.message}"
      Rails.logger.error(error_message)
    end

    private

    def separator
      @object_level_binding ? OBJECT_LEVEL_SEPARATOR : CLASS_LEVEL_SEPARATOR
    end

    def target_const
      if @object_level_binding
        @namespace.constantize
      else
        @namespace.constantize.singleton_class
      end
    end
  end
end
