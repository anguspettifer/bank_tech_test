# frozen_string_literal: true

require 'date'
require 'transaction'

# Records the flow of cash
class TransactionRecords
  attr_reader :details

  def initialize(account, date_class = Date, transaction_class = Transaction)
    @account = account
    @date_class = date_class
    @details = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    check_for_error(amount)
    account.credit(amount)
    update_details(details, date, :credit, amount, account.balance)
  end

  def withdraw(amount)
    check_for_error(amount)
    account.debit(amount)
    update_details(details, date, :debit, amount, account.balance)
  end

  private

  attr_reader :account
  attr_reader :date_class

  def date
    date_class.today
  end

  def update_details(details, date, type, amount, balance)
    details << @transaction_class.new(date, type, amount, balance)
  end

  def check_for_error(amount)
    error_message = 'Can only facilitate positive integer'
    raise error_message unless amount.positive?
  end
end
