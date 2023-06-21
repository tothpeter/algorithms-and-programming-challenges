# frozen_string_literal: true

module InvokedMethodReporter
  class ObjectLevelBinder < Binder
    SEPARATOR = '#'

    private

    def target_const
      namespace.constantize
    end
  end
end
