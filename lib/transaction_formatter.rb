# frozen_string_literal: true

# Understands how to format a transaction
class TransactionFormatter

  def create_format(transaction)
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
