# frozen_string_literal: true

module InvokedMethodReporter
  class Reporter < Module
    MAX_REPORT_COUNT = 5
    @@report_counts = Hash.new(0)

    def initialize(method_name, method_definition)
      define_method(method_name) do |*args|
        InvokedMethodReporter::Reporter.report(method_definition)
        super(*args)
      end
    end

    def self.report(method_definition)
      return if @@report_counts[method_definition] >= MAX_REPORT_COUNT
      @@report_counts[method_definition] += 1

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
        'invoked_method_reporter/Reporter.rb',
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
end
