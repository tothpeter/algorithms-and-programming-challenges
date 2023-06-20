# frozen_string_literal: true

module Rails
  def self.logger
    MockLogger
  end
end

module MockLogger
  def self.info(*); end
  def self.error(*); end
end

class Loan
  def ref_id
    'loan_ref_id'
  end
end
