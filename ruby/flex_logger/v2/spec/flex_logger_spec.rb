require 'active_support/core_ext/array'
require 'logger'

require './flex_logger'
require './flex_logger/message_builder'

class Rails
  def self.logger
    @logger ||= ::Logger.new(STDOUT)
  end
end

class Loan
  def ref_id
    'loan_ref_id'
  end
end

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
end
