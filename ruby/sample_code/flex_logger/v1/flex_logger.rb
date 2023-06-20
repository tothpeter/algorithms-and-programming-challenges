# frozen_string_literal: true

class FlexLogger
  attr_reader :namespace

  def initialize(namespace = nil)
    @namespace = "[#{namespace}]" if namespace
  end

  def self.info(*args)
    new.info(*args)
  end

  def self.error(*args)
    new.error(*args)
  end

  def info(*args)
    @options = build_options_from(args)

    Rails.logger.info(log_message)
  end

  def error(*args)
    @options = build_options_from(args)

    Rails.logger.error(log_message)
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

  def log_message
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
