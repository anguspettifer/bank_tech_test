# frozen_string_literal: true

# Understands how to present transaction history to the user
class Statement
  def initialize(transaction)
    @transaction = transaction
  end

  def view
    format_statement(transaction)
  end

  private

  attr_reader :transaction, :account

  def month_format(month_int)
    MONTH_HASH[month_int]
  end

  def format_statement(transaction)
    format_array = []
    transaction.details.each do |detail|
      # date = detail[0]
      # type = detail[1]
      # amount = detail[2]
      # balance = detail[3]
      format_array << FormattedTransaction.new(date, type, amount, balance).to_s
    end
    format_array << HEADER
    format_array.reverse.join("\n")
  end

  # def formatted_transaction(date, type, amount, balance)
  #   date = formatted_date(date)
  #   credit_amount = format('%.2f', amount) if type == :credit
  #   debit_amount = format('%.2f', amount) if type == :debit
  #   balance = format('%.2f', balance)
  #   "#{date} || #{credit_amount} || #{debit_amount} || #{balance}"
  # end
end
