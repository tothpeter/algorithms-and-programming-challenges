# frozen_string_literal: true

require 'invoked_method_reporter'

Rails.application.config.after_initialize do
  InvokedMethodReporter.setup
end
