# frozen_string_literal: true

require 'formatted_transaction'

# Understands how to present transaction_record history to the user
class Statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transaction_record, formatted_transaction_class = FormattedTransaction)
    @transaction_record = transaction_record
    @formatted_transaction_class = formatted_transaction_class
  end

  def view
    format_statement(transaction_record)
  end

  private

  attr_reader :transaction_record, :account

  def month_format(month_int)
    MONTH_HASH[month_int]
  end

  def format_statement(transaction_record)
    format_array = []
    transaction_record.transactions.each do |transaction|
      format_array << @formatted_transaction_class.new(transaction).create_format
    end
    format_array << HEADER
    format_array.reverse.join("\n")
  end

end
