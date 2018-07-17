# frozen_string_literal: true

require 'date'

# Records the flow of cash
class Transaction
  attr_reader :details

  def initialize(account, date_class = Date)
    @account = account
    @date_class = date_class
    @details = []
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

  def update_details(details, date, type, amount, new_balance)
    transaction = []
    transaction << date
    transaction << type
    transaction << amount
    transaction << new_balance
    details << transaction
  end

  def check_for_error(amount)
    error_message = "Can only facilitate positive integer"
    fail error_message unless amount > 0
  end

end
