# frozen_string_literal: true

# Understands how to present transaction history to the user
class Statement
  def initialize(transaction)
    @transaction = transaction
  end

  def view
    format_statement(transaction)
  end

  private

  attr_reader :transaction, :account
  MONTH_HASH = {
    1 => 'JAN',
    2 => 'FEB',
    3 => 'MAR',
    4 => 'APR',
    5 => 'MAY',
    6 => 'JUN',
    7 => 'JUL',
    8 => 'AUG',
    9 => 'SEP',
    10 => 'OCT',
    11 => 'NOV',
    12 => 'DEC'
  }.freeze

  def formatted_date(date)
    day = date.day
    month_int = date.month
    month_str = month_format(month_int)
    year = date.year
    "#{day}-#{month_str}-#{year}"
  end

  def month_format(month_int)
    MONTH_HASH[month_int]
  end

  def format_statement(transaction)
    format_array = []
    transaction.details.each do |detail|
      date = detail[0]
      type = detail[1]
      amount = detail[2]
      balance = detail[3]
      format_array << formatted_transaction(date, type, amount, balance)
    end
    format_array << 'date || credit || debit || balance'
    format_array.reverse!
    format_array.join("\n")
  end

  def formatted_transaction(date, type, amount, balance)
    date = formatted_date(date)
    credit_amount = format('%.2f', amount) if type == :credit
    debit_amount = format('%.2f', amount) if type == :debit
    balance = format('%.2f', balance)
    "#{date} || #{credit_amount} || #{debit_amount} || #{balance}"
  end
end
