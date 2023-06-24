# frozen_string_literal: true

module InvokedMethodReporter
  class Binder
    # method_definition is a string. Example: 'User#unused_method'
    def self.bind_reporter_to(method_definition)
      if method_definition.include?(ObjectLevelBinder::SEPARATOR)
        ObjectLevelBinder.new(method_definition).bind_reporter
      else
        ClassLevelBinder.new(method_definition).bind_reporter
      end
    end

    attr_reader :namespace, :method_name, :method_definition

    # method_definition is a string. Example: 'User#unused_method'
    def initialize(method_definition)
      @method_definition       = method_definition
      @namespace, @method_name = method_definition.split(self.class::SEPARATOR)
    end

    def bind_reporter
      reporter = Reporter.new(method_name, method_definition)
      target_const.prepend(reporter)
    rescue StandardError => e
      error_message = "[InvokedMethodReporter] Can't watch #{method_definition} because #{e.message}"
      Rails.logger.error(error_message)
    end

    private

    def target_const
      raise NotImplementedError
    end
  end
end
