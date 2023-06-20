# frozen_string_literal: true

module Rollbar
  def self.info(*args); end
  def self.error(*args); end
end

module Rails
  def self.logger
    MockLogger
  end

  def self.env
    MockEnv
  end
end

module MockLogger
  def self.info(*args); end
  def self.error(*args); end
end

module MockEnv
  def self.test?
    true
  end
end
