# frozen_string_literal: true

# Understands how to format a transaction
class FormattedTransaction
  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def create_format
    # is this method doing too much?
    date = format_date(transaction.date)
    type = transaction.type
    amount = transaction.amount
    balance = transaction.balance
    credit_amount = format('%.2f', amount) if type == :credit
    debit_amount = format('%.2f', amount) if type == :debit
    balance = format('%.2f', balance)
    "#{date} || #{credit_amount} || #{debit_amount} || #{balance}"
  end

  private

  def format_date(date)
    day = date.day
    month = date.month
    year = date.year
    "#{day}/#{month}/#{year}"
  end
end
