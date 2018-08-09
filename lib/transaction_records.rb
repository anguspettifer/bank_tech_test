# frozen_string_literal: true

require 'date'
require 'transaction'

# Records the flow of cash
class TransactionRecords
  attr_reader :transactions

  def initialize(account, transaction_class = Transaction)
    @account = account
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    check_for_error(amount)
    account.credit(amount)
    update_transactions({
      type: :credit,
      amount: amount,
      balance: account.balance
      })
  end

  def withdraw(amount)
    check_for_error(amount)
    account.debit(amount)
    update_transactions({
      type: :debit,
      amount: amount,
      balance: account.balance
      })
  end

  private

  attr_reader :account

  def update_transactions(details)
    transactions << @transaction_class.new(details)
  end

  def check_for_error(amount)
    error_message = 'Can only facilitate positive integer'
    raise error_message unless amount.positive?
  end
end
