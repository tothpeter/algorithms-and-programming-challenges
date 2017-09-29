module Assertions
  def capture_io
    require 'stringio'

    orig_stdout, orig_stderr         = $stdout, $stderr
    captured_stdout, captured_stderr = StringIO.new, StringIO.new
    $stdout, $stderr                 = captured_stdout, captured_stderr

    yield

    return captured_stdout.string, captured_stderr.string
  ensure
    $stdout = orig_stdout
    $stderr = orig_stderr
  end
end

def test_batch_examples examples, method_to_invoke = :solution
  examples.each do |example|
    context example[:context] do
      it "returns #{example[:expected_output]} for #{example[:input]}" do
        output = send method_to_invoke, *example[:input]

        expect(output).to eq(example[:expected_output])
      end
    end
  end
end

RSpec.configure do |config|
  config.include Assertions
end
