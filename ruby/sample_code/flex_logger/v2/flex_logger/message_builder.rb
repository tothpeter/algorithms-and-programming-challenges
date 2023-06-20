# frozen_string_literal: true

class FlexLogger::MessageBuilder
  attr_reader :namespace

  def initialize(namespace = nil)
    @namespace = "[#{namespace}]" if namespace
  end

  def build(*args)
    @options = build_options_from(args)

    build_message
  end

  private

  def build_options_from(args)
    result = {
      message_fragments: []
    }

    exception = nil

    args.each do |arg|
      case arg
      when NilClass
        result[:message_fragments] << 'nil'
      when StandardError
        exception = arg
      when Loan
        result[:ref_id] = arg.ref_id
      else
        result[:message_fragments] << arg.to_s
      end
    end

    result[:message_fragments] << render_exception(exception) if exception

    result
  end

  def build_message
    ref_id            = @options[:ref_id]
    message_fragments = @options[:message_fragments]

    result = +''
    result << namespace if namespace
    result << "[#{ref_id}]" if ref_id
    result << ' ' if ref_id || namespace

    result << message_fragments.join(' | ') if message_fragments.present?

    result
  end

  def render_exception(exception)
    "#{exception.class}: #{exception.message} #{exception.backtrace&.first}"
  end
end
