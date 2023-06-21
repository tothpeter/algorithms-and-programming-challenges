# frozen_string_literal: true

module InvokedMethodReporter
  class ReporterJob < ActiveJob::Base
    queue_as :default

    def perform(message, original_caller)
      Rollbar.info(message, sender: original_caller)
    end
  end
end
