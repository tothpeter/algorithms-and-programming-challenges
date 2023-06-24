# frozen_string_literal: true

require 'invoked_method_reporter/binder'
require 'invoked_method_reporter/reporter'
require 'invoked_method_reporter/reporter_job'

module Rollbar
  def self.info(*args); end
  def self.error(*args); end
end

module InvokedMethodReporter
  CONFIG_FILE_PATH = 'config/invoked_method_reporter.yml'

  def self.setup(config_file_path = CONFIG_FILE_PATH)
    config = YAML.load_file(config_file_path)

    watch(config['method_definitions'])
  end

  # method_definitions can be an array or a single item
  # An method_definition item is a string. Example: 'User#unused_method'
  def self.watch(method_definitions)
    Array(method_definitions).each do |method_definition|
      Binder.bind_reporter_to(method_definition)
    end
  end
end
