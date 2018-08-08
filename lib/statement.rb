# frozen_string_literal: true

require 'transaction_formatter'

# Understands how to present transaction_record history to the user
class Statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transaction_record, transaction_formatter = TransactionFormatter.new)
    @transaction_record = transaction_record
    @transaction_formatter = transaction_formatter
  end

  def view
    format_statement(transaction_record)
  end

  private

  attr_reader :transaction_record, :account

  def format_statement(transaction_record)
    format_array = []
    transaction_record.transactions.each do |transaction|
      format_array << @transaction_formatter.create_format(transaction)
    end
    format_array << HEADER
    format_array.reverse.join("\n")
  end
end
