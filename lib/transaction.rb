require 'date'

class Transaction
  attr_reader :details

  def initialize(account, date_class = Date)
    @account = account
    @date_class = date_class
    @details = []
  end

  def deposit(ammount)
    account.credit(ammount)
    update_details(details, date, :credit, ammount, account.balance)
  end

  def withdraw(ammount)
    account.debit(ammount)
    update_details(details, date, :debit, ammount, account.balance)
  end

  private
  attr_reader :account

  def date
    @date_class.today
  end

  def update_details(details, date, type, ammount, new_balance)
    @details << date
    @details << type
    @details << ammount
    @details << new_balance
  end

end
