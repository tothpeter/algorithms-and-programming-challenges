# frozen_string_literal: true

require 'invoked_method_reporter/binder'
require 'invoked_method_reporter/class_level_binder'
require 'invoked_method_reporter/object_level_binder'
require 'invoked_method_reporter/reporter_job'

module Rollbar
  def self.info(*args); end
  def self.error(*args); end
end

module InvokedMethodReporter
  CONFIG_FILE_PATH = 'config/invoked_method_reporter.yml'
  MAX_REPORT_COUNT = 10

  @@report_count = Hash.new(0)

  def self.setup(config_file_path = CONFIG_FILE_PATH)
    config = YAML.load_file(config_file_path)

    bind_to(config['method_definitions'])
  end

  # method_definitions can be an array or a single item
  def self.bind_to(method_definitions)
    class_level_methods, obj_level_methods = Array(method_definitions)
                                               .partition { |m| m.include?('.') }

    class_level_methods.each do |method_definition|
      ClassLevelBinder.bind_to(method_definition)
    end

    obj_level_methods.each do |method_definition|
      ObjectLevelBinder.bind_to(method_definition)
    end
  end

  def self.report(method_definition)
    return if @@report_count[method_definition] >= MAX_REPORT_COUNT
    @@report_count[method_definition] += 1

    message = "[InvokedMethodReporter] #{method_definition} was invoked"
    original_caller = fetch_original_caller

    Rails.logger.info("#{message} #{original_caller}")
    ReporterJob.perform_later(message, original_caller)
  rescue StandardError => e
    Rollbar.error('Error in InvokedMethodReporter.report', e)
    raise(e) if Rails.env.test?
  end

  def self.fetch_original_caller
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

  private_class_method :fetch_original_caller
end
