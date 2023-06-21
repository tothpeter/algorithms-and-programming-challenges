# frozen_string_literal: true

require 'rails_helper'

describe InvokedMethodReporter do
  module TargetModule
    def original_impl_from_module; end

    def method_from_module
      original_impl_from_module
    end

    def self.original_impl_in_module; end

    def self.method_in_module
      original_impl_in_module
    end
  end

  class TargetClass
    def method_from_class
      original_impl_from_module
    end

    def self.method_from_class
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

    context 'when the method is defined in the target module' do
      it 'invokes the reporter then the original implementation' do
        expect(described_class).to receive(:report).ordered.and_call_original
        expect(TargetModule).to receive(:original_impl_in_module).ordered

        TargetModule.method_in_module
      end
    end

    context 'when the method is defined in an included module' do
      context 'object level method' do
        it 'invokes the reporter then the original implementation' do
          target_class_object = TargetClass.new

          expect(described_class).to receive(:report).ordered.and_call_original
          expect(target_class_object).to receive(:original_impl_from_module).ordered

          target_class_object.method_from_module
        end
      end

      context 'class level method' do
        it 'invokes the reporter then the original implementation' do
          expect(described_class).to receive(:report).ordered.and_call_original
          expect(TargetClass).to receive(:original_impl_from_module).ordered

          TargetClass.method_from_module
        end
      end
    end

    context 'when the method is defined the class itself' do
      context 'object level method' do
        it 'invokes the reporter then the original implementation' do
          target_class_object = TargetClass.new

          expect(described_class).to receive(:report).ordered.and_call_original
          expect(target_class_object).to receive(:original_impl_from_module).ordered

          target_class_object.method_from_class
        end
      end

      context 'class level method' do
        it 'invokes the reporter then the original implementation' do
          expect(described_class).to receive(:report).ordered.and_call_original
          expect(TargetClass).to receive(:original_impl_from_module).ordered

          TargetClass.method_from_class
        end
      end
    end
  end

  describe '.report' do
    context 'when the method is defined in a module and added to the class' do
      it 'invokes Rollbar with the right params' do
        expected_message = '[InvokedMethodReporter] TargetModule#method_from_module was invoked'

        expect(Rollbar).to receive(:info).with(expected_message, anything).exactly(2).times

        TargetClass.method_from_module
        TargetClass.new.method_from_module
      end
    end

    context 'when the method is defined by the class itself' do
      it 'invokes Rollbar with the right params' do
        expected_message1 = '[InvokedMethodReporter] TargetClass#method_from_class was invoked'
        expected_message2 = '[InvokedMethodReporter] TargetClass.method_from_class was invoked'

        expect(Rollbar).to receive(:info).with(expected_message1, anything)
        expect(Rollbar).to receive(:info).with(expected_message2, anything)

        TargetClass.method_from_class
        TargetClass.new.method_from_class
      end
    end
  end
end
