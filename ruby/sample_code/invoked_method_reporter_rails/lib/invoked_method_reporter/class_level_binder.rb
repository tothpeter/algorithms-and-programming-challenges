# frozen_string_literal: true

module InvokedMethodReporter
  class ClassLevelBinder < Binder
    # Separates the namespace from the method name e.g.: 'User.find'
    SEPARATOR = '.'

    private

    def target_const
      namespace.constantize.singleton_class
    end
  end
end
