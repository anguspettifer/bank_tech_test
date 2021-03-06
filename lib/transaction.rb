# frozen_string_literal: true

require 'date'

# Understands details of a transaction
class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(details, date = Date.today)
    @date = format_date(date)
    @type = details[:type]
    @amount = details[:amount]
    @balance = details[:balance]
  end

  def format_date(date)
    day = date.day
    month = date.month
    year = date.year
    "#{day}/#{month}/#{year}"
  end

end
