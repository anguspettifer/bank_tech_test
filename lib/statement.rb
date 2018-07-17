class Statement

  def initialize(transaction)
    @transaction = transaction
  end

  def view
    format_statement(transaction)
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

  def format_statement(transaction)
    format_array = []
    format_array << "date || credit || debit || balance"
    transaction.details.each do |detail|
      date = detail[0]
      type = detail[1]
      amount = detail[2]
      balance = detail[3]
      format_array << formatted_transaction(date, type, amount, balance)
    end
    format_array.join("\n")
  end

  def formatted_transaction(date, type, amount, balance)
    credit_amount = "%.2f" % amount if type == :credit
    debit_amount = "%.2f" % amount if type == :debit
    "#{formatted_date(date)} || #{ credit_amount} || #{debit_amount} || #{"%.2f" % balance}"
  end
end
