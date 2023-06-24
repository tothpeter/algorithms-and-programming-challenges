# frozen_string_literal: true

module InvokedMethodReporter
  class ObjectLevelReporter < Reporter
    SEPARATOR = '#'

    private

    def target_const
      namespace.constantize
    end
  end
end
