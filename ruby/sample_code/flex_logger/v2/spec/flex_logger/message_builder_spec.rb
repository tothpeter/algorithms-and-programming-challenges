require 'active_support/core_ext/array'
require 'ostruct'

require './flex_logger'
require './flex_logger/message_builder'

class Loan
  def ref_id
    'loan_ref_id'
  end
end

describe FlexLogger::MessageBuilder do
  describe '.build' do
    describe 'comprehensive case' do
      it 'returns the expected log message' do
        builder = described_class.new('namespace')

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

        expected_log_message = '[namespace][loan_ref_id] Log message' +
                               ' | {:a=>1, :b=>2}' +
                               ' | 88' +
                               ' | nil' +
                               ' | #<OpenStruct param1="val">' +
                               ' | StandardError: Error message '

        log_message = builder.build(*arguments)

        expect(log_message).to eq(expected_log_message)
      end
    end

    context 'when there is no prefix' do
      it 'returns the expected log message' do
        builder = described_class.new
        log_message = builder.build('Log message')

        expected_log_message = 'Log message'

        expect(log_message).to eq(expected_log_message)
      end
    end
  end
end
