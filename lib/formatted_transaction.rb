# frozen_string_literal: true

# Understands how to format a transaction
class FormattedTransaction
  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def create_format
    credit = format_two_dp(transaction.amount) if transaction.type == :credit
    debit = format_two_dp(transaction.amount) if transaction.type == :debit
    balance = format_two_dp(transaction.balance)
    "#{transaction.date} || #{credit} || #{debit} || #{balance}"
  end

  private

  def format_two_dp(number)
    format('%.2f', number)
  end

end
