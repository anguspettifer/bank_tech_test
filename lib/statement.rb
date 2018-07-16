class Statement

  def initialize(transaction, account)
    @transaction = transaction
    @account = account
  end

  def view_latest
    date = transaction.details[0]
    transaction_type = transaction.details[1]
    transaction_ammount = transaction.details[2]
    balance = account.balance
    "Date: #{formatted_date(date)}, #{transaction_type}: #{transaction_ammount}, balance: #{balance}"
  end

  private
  attr_reader :transaction, :account


  def formatted_date(date)
    day = date.day
    month_int = date.month
    month_str = month_format(month_int)
    year = date.year
    formatted_date = "#{day}-#{month_str}-#{year}"
  end

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
