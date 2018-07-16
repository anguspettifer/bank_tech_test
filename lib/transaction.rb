require 'date'

class Transaction

  def initialize(account, date = Date)
    @account = account
    @date_class = date
  end

  def deposit(ammount)
    @account.credit(ammount)
  end

  def withdraw(ammount)
    @account.debit(ammount)
  end

  def date
    month_hash = {
      7 => "JUL"
    }
    day = @date_class.today.day
    month_int = @date_class.today.month
    month_str = month_hash[month_int]
    year = @date_class.today.year
    formatted_date = "#{day}-#{month_str}-#{year}"
  end

end
