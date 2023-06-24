# frozen_string_literal: true

module InvokedMethodReporter
  class ObjectLevelBinder < Binder
    # Separates the namespace from the method name e.g.: 'User#full_name'
    SEPARATOR = '#'

    private

    def target_const
      namespace.constantize
    end
  end
end
