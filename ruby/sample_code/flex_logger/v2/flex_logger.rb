# frozen_string_literal: true

class FlexLogger
  attr_reader :message_builder

  def initialize(namespace = nil)
    @message_builder = MessageBuilder.new(namespace)
  end

  def self.info(*args)
    new.info(*args)
  end

  def self.error(*args)
    new.error(*args)
  end

  def info(*args)
    log_message = message_builder.build(*args)

    Rails.logger.info(log_message)
  end

  def error(*args)
    log_message = message_builder.build(*args)

    Rails.logger.error(log_message)
  end
end
