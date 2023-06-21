# frozen_string_literal: true

module UnusedModule
  def unused_method
    p '== Unused method from module =='
  end

  def self.class_level
    p '== Unused class method from module =='
  end
end
