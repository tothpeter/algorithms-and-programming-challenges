require 'active_support/core_ext/array'
require 'ostruct'

require '../mocks'

require './flex_logger'

describe FlexLogger do
  describe '.info' do
    it 'proxies the call to the Rails logger' do
      allow(Rails.logger).to receive(:info)

      described_class.info('Log message')

      expected_log_message = 'Log message'

      expect(Rails.logger).to have_received(:info).with(expected_log_message)
    end
  end

  describe '.error' do
    it 'proxies the call to the Rails logger' do
      allow(Rails.logger).to receive(:error)

      described_class.error('Log message')

      expected_log_message = 'Log message'

      expect(Rails.logger).to have_received(:error).with(expected_log_message)
    end
  end

  describe '#info' do
    it 'proxies the call to the Rails logger' do
      allow(Rails.logger).to receive(:info)

      flex_logger = described_class.new('namespace')
      flex_logger.info('Log message')

      expected_log_message = '[namespace] Log message'

      expect(Rails.logger).to have_received(:info).with(expected_log_message)
    end
  end

  describe '#error' do
    it 'proxies the call to the Rails logger' do
      allow(Rails.logger).to receive(:error)

      flex_logger = described_class.new('namespace')
      flex_logger.error('Log message')

      expected_log_message = '[namespace] Log message'

      expect(Rails.logger).to have_received(:error).with(expected_log_message)
    end
  end

  describe 'comprehensive case' do
    it 'builds the expected log message' do
      allow(Rails.logger).to receive(:info)

      flex_logger = described_class.new('namespace')

      random_object = OpenStruct.new(param1: 'val')

      arguments = [
        'Log message',
        { a: 1, b: 2 },
        88,
        nil,
        Loan.new,
        StandardError.new('Error message'),
        random_object
      ]

      expected_log_message = '[namespace][loan_ref_id] Log message | ' +
                             '{:a=>1, :b=>2} | ' +
                             '88 | ' +
                             'nil | ' +
                             '#<OpenStruct param1="val"> | ' +
                             'StandardError: Error message '

      flex_logger.info(*arguments)

      expect(Rails.logger).to have_received(:info).with(expected_log_message)
    end
  end

  context 'when there is no prefix' do
    it 'builds the expected log message' do
      allow(Rails.logger).to receive(:info)

      flex_logger = described_class.new
      flex_logger.info('Log message')

      expected_log_message = 'Log message'

      expect(Rails.logger).to have_received(:info).with(expected_log_message)
    end
  end
end
