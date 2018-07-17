# frozen_string_literal: true

# Understands how to present transaction_record history to the user
class Statement
  def initialize(transaction_record)
    @transaction_record = transaction_record
  end

  def view
    format_statement(transaction_record)
  end

  private

  attr_reader :transaction_record, :account

  def month_format(month_int)
    MONTH_HASH[month_int]
  end

  def format_statement(transaction_record, formatted_transaction_class = FormattedTransaction)
    format_array = []
    transaction_record.transactions.each do |transaction|
      # date = detail[0]
      # type = detail[1]
      # amount = detail[2]
      # balance = detail[3]
      format_array << formatted_transaction_class.new(transaction).to_s
    end
    format_array << HEADER
    format_array.reverse.join("\n")
  end

  # def formatted_transaction_record(date, type, amount, balance)
  #   date = formatted_date(date)
  #   credit_amount = format('%.2f', amount) if type == :credit
  #   debit_amount = format('%.2f', amount) if type == :debit
  #   balance = format('%.2f', balance)
  #   "#{date} || #{credit_amount} || #{debit_amount} || #{balance}"
  # end
end
