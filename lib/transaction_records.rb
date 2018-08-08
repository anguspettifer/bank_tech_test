# frozen_string_literal: true

require 'date'
require 'transaction'

# Records the flow of cash
class TransactionRecords
  attr_reader :transactions

  def initialize(account, date_class = Date, transaction_class = Transaction)
    @account = account
    @date_class = date_class
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    check_for_error(amount)
    account.credit(amount)
    update_transactions(date, :credit, amount, account.balance)
  end

  def withdraw(amount)
    check_for_error(amount)
    account.debit(amount)
    update_transactions(date, :debit, amount, account.balance)
  end

  private

  attr_reader :account
  attr_reader :date_class

  def date
    # should date be here?
    date_class.today
  end

  def update_transactions(date, type, amount, balance)
    transactions << @transaction_class.new(date, type, amount, balance)
  end

  def check_for_error(amount)
    error_message = 'Can only facilitate positive integer'
    raise error_message unless amount.positive?
  end
end
