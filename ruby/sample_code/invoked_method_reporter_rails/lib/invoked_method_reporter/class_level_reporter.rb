# frozen_string_literal: true

module InvokedMethodReporter
  class ClassLevelReporter < Reporter
    SEPARATOR = '.'

    private

    def target_const
      namespace.constantize.singleton_class
    end
  end
end
