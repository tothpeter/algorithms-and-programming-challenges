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

  describe '.watch' do
    context 'when the target constant is not defined' do
      it 'does not raise an error' do
        expect do
          described_class.watch('NonExistentTargetModule#method')
        end.not_to raise_error
      end
    end
  end

  context 'when methods are defined in a module' do
    context 'when the method is available on the object level of a class' do
      it 'invokes the reporter then the original implementation' do
        target_class_instance = TargetClass.new

        expected_method_definition = 'TargetModule#method_from_module'

        allow(InvokedMethodReporter::Reporter).to receive(:report)
          .and_call_original
        allow(target_class_instance).to receive(:original_impl_from_module)

        target_class_instance.method_from_module

        expect(InvokedMethodReporter::Reporter).to have_received(:report)
          .ordered
        expect(target_class_instance).to have_received(:original_impl_from_module)
          .ordered
      end
    end

    context 'when the method is available on the class level of a class' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetModule#method_from_module'

        allow(InvokedMethodReporter::Reporter).to receive(:report)
          .and_call_original
        allow(TargetClass).to receive(:original_impl_from_module)

        TargetClass.method_from_module

        expect(InvokedMethodReporter::Reporter).to have_received(:report)
          .with(expected_method_definition).ordered
        expect(TargetClass).to have_received(:original_impl_from_module).ordered
      end
    end

    context 'when the method is available on the class level of a module' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetModule.class_method_on_module'

        allow(InvokedMethodReporter::Reporter).to receive(:report)
          .and_call_original
        allow(TargetModule).to receive(:original_class_impl_in_module)

        TargetModule.class_method_on_module

        expect(InvokedMethodReporter::Reporter).to have_received(:report)
          .with(expected_method_definition).ordered
        expect(TargetModule).to have_received(:original_class_impl_in_module)
          .ordered
      end
    end
  end

  context 'when methods are defined in a class' do
    context 'object level method' do
      it 'invokes the reporter then the original implementation' do
        target_class_instance = TargetClass.new

        expected_method_definition = 'TargetClass#instance_method_from_class'

        allow(InvokedMethodReporter::Reporter).to receive(:report)
          .and_call_original
        allow(target_class_instance).to receive(:original_impl_from_module)

        target_class_instance.instance_method_from_class

        expect(InvokedMethodReporter::Reporter).to have_received(:report)
          .with(expected_method_definition).ordered
        expect(target_class_instance).to have_received(:original_impl_from_module)
          .ordered
      end
    end

    context 'class level method' do
      it 'invokes the reporter then the original implementation' do
        expected_method_definition = 'TargetClass.class_method_from_class'

        allow(InvokedMethodReporter::Reporter).to receive(:report)
          .and_call_original
        allow(TargetClass).to receive(:original_impl_from_module)

        TargetClass.class_method_from_class

        expect(InvokedMethodReporter::Reporter).to have_received(:report)
          .with(expected_method_definition).ordered
        expect(TargetClass).to have_received(:original_impl_from_module).ordered
      end
    end
  end

  describe 'reporting' do
    include ActiveJob::TestHelper

    it 'invokes Rollbar with the expected params' do
      expected_message = '[InvokedMethodReporter] TargetClass.class_method_from_class was invoked'
      allow(Rollbar).to receive(:info).and_call_original

      perform_enqueued_jobs do
        TargetClass.class_method_from_class
      end

      expect(Rollbar).to have_received(:info).with(expected_message, anything)
    end

    it 'reports one method max InvokedMethodReporter::Reporter::MAX_REPORT_COUNT times' do
      allow(InvokedMethodReporter::ReporterJob).to receive(:perform_later)
        .and_call_original

      InvokedMethodReporter::Reporter::MAX_REPORT_COUNT.times do
        InvokedMethodReporter::Reporter.report('fake_method')
      end

      InvokedMethodReporter::Reporter.report('fake_method')

      expect(InvokedMethodReporter::ReporterJob).to have_received(:perform_later)
        .exactly(InvokedMethodReporter::Reporter::MAX_REPORT_COUNT)
        .times
    end
  end
end
