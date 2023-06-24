# frozen_string_literal: true

require 'invoked_method_reporter/binder'
require 'invoked_method_reporter/reporter'
require 'invoked_method_reporter/reporter_job'

module Rollbar
  def self.info(*args); end
  def self.error(*args); end
end

# We use this module to verify that a method is not used anymore
# to reduce technical debt.
# We do this by marking the suspected methods in the config
# file (InvokedMethodReporter::CONFIG_FILE_PATH).
# Then we wait a month and if the method is not invoked, we can safely remove it.
#
# To mark a method, we need to specify its method definition.
# The method definition follows the following format: "{namespace}{spearator}{method_name}".
# Where:
#   - namespace: is the constant name where the method is defined it can be a class or a module.
#   - separator: is the # sign for instance methods or the . sign for class methods
#   - method_name: is the name of the method
#
# Example:
#   User#full_name
#   User.last
#
# We use Rollbar monitor the invocations.
#
# Usage:
#   # This loads the config file and binds a reporter to the specified methods
#   InvokedMethodReporter.setup
#   # This marks an individual method for monitoring
#   InvokedMethodReporter.watch('User#unused_method')
#   # This marks multiple methods for monitoring
#   InvokedMethodReporter.watch(['User#unused_method', 'User#another_unused_method'])
#

module InvokedMethodReporter
  CONFIG_FILE_PATH = 'config/invoked_method_reporter.yml'

  # This method loads the config file and marks the specified methods
  # for monitoring
  def self.setup(config_file_path = CONFIG_FILE_PATH)
    config = YAML.load_file(config_file_path)

    watch(config['method_definitions'])
  end

  # This method binds a reporter to the specified method(s)
  # so that we can monitor them
  # @param method_definitions [Array<String>, String]
  # @example
  #   InvokedMethodReporter.watch('User#unused_method')
  #   InvokedMethodReporter.watch(['User#unused_method', 'User#another_unused_method'])
  def self.watch(method_definitions)
    Array(method_definitions).each do |method_definition|
      Binder.bind_reporter_to(method_definition)
    end
  end
end
