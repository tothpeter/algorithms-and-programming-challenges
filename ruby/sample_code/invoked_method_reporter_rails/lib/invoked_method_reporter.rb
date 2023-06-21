# frozen_string_literal: true

require 'invoked_method_reporter/binder'
require 'invoked_method_reporter/class_level_binder'
require 'invoked_method_reporter/object_level_binder'

module Rollbar
  def self.info(*args); end
  def self.error(*args); end
end

module InvokedMethodReporter
  CONFIG_FILE_PATH = 'config/invoked_method_reporter.yml'

  def self.setup(config_file_path = CONFIG_FILE_PATH)
    config = YAML.load_file(config_file_path)

    bind_to(config['methods'])
  end

  def self.bind_to(methods)
    class_level_methods, obj_level_methods = Array(methods).partition { |m| m.include?('.') }

    obj_level_methods.each do |method_definition|
      ObjectLevelBinder.bind_to(method_definition)
    end

    class_level_methods.each do |method_definition|
      ClassLevelBinder.bind_to(method_definition)
    end
  end

  def self.report(method_definition)
    message = "[InvokedMethodReporter] #{method_definition} was invoked"

    report_params = {
      sender: backtrace
    }

    Rollbar.info(message, report_params)
    Rails.logger.info("#{message} #{report_params.to_json}")
  rescue StandardError => e
    Rollbar.error('Error in InvokedMethodReporter.report', e)
    raise(e) if Rails.env.test?
  end

  def self.backtrace
    backtrace_cleaner = ActiveSupport::BacktraceCleaner.new

    filters = [
      'invoked_method_reporter/binder.rb',
      'invoked_method_reporter.rb',
      'gems'
    ]

    backtrace_cleaner.add_silencer do |line|
      filters.any? { |filter| line.include?(filter) }
    end

    backtrace_cleaner.clean(caller).first
  end

  private_class_method :backtrace
end
