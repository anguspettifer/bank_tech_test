class Statement

  def initialize(transaction)
    @transaction = transaction
  end

  def view_latest
    date = transaction.details[0][0]
    transaction_type = transaction.details[0][1]
    transaction_ammount = transaction.details[0][2]
    balance = transaction.details[0][3]
    "Date: #{formatted_date(date)}, #{transaction_type}: #{transaction_ammount}, balance: #{balance}"
  end

  def view
    horrible_array = []
    horrible_array << "date || credit || debit || balance"
    for i in 0...transaction.details.size do
      date = transaction.details[i][0]
      transaction_type = transaction.details[i][1]
      transaction_ammount = "%.2f" % transaction.details[i][2]
      balance = "%.2f" % transaction.details[i][3]
      if transaction_type == :credit
        credit_ammount = transaction_ammount
        debit_ammount = ""
      else
        debit_ammount = transaction_ammount
        credit_ammount = ""
      end
      horrible_array << "#{formatted_date(date)} || #{credit_ammount} || #{debit_ammount} || #{balance}"
    end
    horrible_array.join("\n")
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
