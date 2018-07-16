require 'date'

class Transaction
  attr_reader :details

  def initialize(account, date_class = Date)
    @account = account
    @date_class = date_class
    @details = []
  end

  def deposit(ammount)
    @account.credit(ammount)
    @details << date
    @details << :credit
    @details << ammount
  end

  def withdraw(ammount)
    @account.debit(ammount)
  end

  def date
    day = @date_class.today.day
    month_int = @date_class.today.month
    month_str = month_format(month_int)
    year = @date_class.today.year
    formatted_date = "#{day}-#{month_str}-#{year}"
  end

  private

  def month_format(month_int)
    month_hash = {
      1 => "JAN",
      2 => "FEB",
      3 => "MAR",
      4 => "APR",
      5 => "MAY",
      6 => "JUN",
      7 => "JUL",
      8 => "AUG",
      9 => "SEP",
      10 => "OCT",
      11 => "NOV",
      12 => "DEC"
    }
    month_str = month_hash[month_int]
  end

end
