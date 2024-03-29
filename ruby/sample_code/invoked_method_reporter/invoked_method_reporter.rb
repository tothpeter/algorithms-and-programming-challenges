# frozen_string_literal: true

require 'json'

require 'active_support/inflector'
require 'active_support/backtrace_cleaner'

require './mocks'

require './invoked_method_reporter/binder'
require './invoked_method_reporter/class_level_binder'
require './invoked_method_reporter/object_level_binder'
require './invoked_method_reporter/config'

module InvokedMethodReporter
  def self.config
    @config ||= Config.new
  end

  def self.setup
    bind_to(config.methods_to_report)
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
      sender: sender_trace
    }

    Rollbar.info(message, report_params)
    Rails.logger.info("#{message} #{report_params.to_json}")
  rescue StandardError => e
    Rollbar.error('Error in InvokedMethodReporter.report', e)
    raise e if Rails.env.test?
  end

  def self.sender_trace
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

  private_class_method :sender_trace
end
