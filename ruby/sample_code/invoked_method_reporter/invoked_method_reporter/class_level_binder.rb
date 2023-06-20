# frozen_string_literal: true

module InvokedMethodReporter
  class ClassLevelBinder < Binder
    SEPARATOR = '.'

    private

    def target_const
      namespace.constantize.singleton_class
    end
  end
end
