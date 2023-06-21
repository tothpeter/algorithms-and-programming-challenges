# frozen_string_literal: true

require 'rails_helper'

describe InvokedMethodReporter do
  module TargetModule
    def method_from_module
      original_impl_from_module
    end

    def original_impl_from_module; end

    def self.class_method_on_module
      original_class_impl_in_module
    end

    def self.original_class_impl_in_module; end
  end

  class TargetClass
    def instance_method_from_class
      original_impl_from_module
    end

    def self.class_method_from_class
      original_impl_from_module
    end
  end

  TargetClass.include(TargetModule)
  TargetClass.extend(TargetModule)

  before(:all) do
    InvokedMethodReporter.setup('spec/fixtures/invoked_method_reporter_config.yml')
  end

  after(:all) do
    Object.send(:remove_const, :TargetModule)
    Object.send(:remove_const, :TargetClass)
  end

  describe '.bind_to' do
    context 'when the target constant is not defined' do
      it 'does not raise an error' do
        expect do
          described_class.bind_to('NonExistentTargetModule#method')
        end.not_to raise_error
      end
    end
  end

  describe 'methods coming from a module' do
    describe 'class level method defined on the target module' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetModule.class_method_on_module'

        expect(described_class).to receive(:report)
          .with(expected_method_definition).ordered.and_call_original
        expect(TargetModule).to receive(:original_class_impl_in_module).ordered

        TargetModule.class_method_on_module
      end
    end

    describe 'object level method of a class' do
      it 'invokes the reporter then the original implementation' do
        target_class_instance = TargetClass.new

        expected_method_definition = 'TargetModule#method_from_module'

        expect(described_class).to receive(:report).ordered.and_call_original
        expect(target_class_instance).to receive(:original_impl_from_module).ordered

        target_class_instance.method_from_module
      end
    end

    describe 'class level method of a class' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetModule#method_from_module'

        expect(described_class).to receive(:report)
          .with(expected_method_definition).ordered.and_call_original
        expect(TargetClass).to receive(:original_impl_from_module).ordered

        TargetClass.method_from_module
      end
    end
  end

  describe 'methods coming from a class' do
    describe 'object level method' do
      it 'invokes the reporter then the original implementation' do
        target_class_instance = TargetClass.new

        expected_method_definition = 'TargetClass#instance_method_from_class'

        expect(described_class).to receive(:report)
          .with(expected_method_definition).ordered.and_call_original
        expect(target_class_instance).to receive(:original_impl_from_module).ordered

        target_class_instance.instance_method_from_class
      end
    end

    describe 'class level method' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetClass.class_method_from_class'

        expect(described_class).to receive(:report)
          .with(expected_method_definition).ordered.and_call_original
        expect(TargetClass).to receive(:original_impl_from_module).ordered

        TargetClass.class_method_from_class
      end
    end
  end

  describe 'reporting' do
    it 'invokes Rollbar with the expected params' do
      expected_message1 = '[InvokedMethodReporter] TargetClass#instance_method_from_class was invoked'
      expected_message2 = '[InvokedMethodReporter] TargetClass.class_method_from_class was invoked'

      expect(Rollbar).to receive(:info).with(expected_message1, anything)
      expect(Rollbar).to receive(:info).with(expected_message2, anything)

      TargetClass.new.instance_method_from_class
      TargetClass.class_method_from_class
    end
  end
end
