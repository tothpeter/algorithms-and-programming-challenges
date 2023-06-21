# frozen_string_literal: true

require './invoked_method_reporter'
require './invoked_method_reporter/config'

describe InvokedMethodReporter::Config do
  describe '#methods_to_report' do
    it 'returns the right config' do
      mock_config = {
        'methods_to_report' => [
          'User.last'
        ]
      }

      expect(YAML).to receive(:load_file).and_return(mock_config)

      result = described_class.new.methods_to_report

      expect(result).to eq(['User.last'])
    end
  end
end
