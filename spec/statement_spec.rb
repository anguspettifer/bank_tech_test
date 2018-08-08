# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction_record_double) do
    double :transaction_record,
           transactions: [
             :transaction_one_double,
             :transaction_two_double,
             :transaction_three_double
           ]
  end

  let(:transaction_formatter_double) { double :transaction_formatter }

  subject(:statement) { described_class.new(transaction_record_double, transaction_formatter_double) }

  describe '#view' do
    it 'Returns statement in user friendly format' do
      formatted_transaction_one = '15/7/2018 || 50.00 ||  || 150.00'
      formatted_transaction_two = '16/7/2018 || 125.00 ||  || 275.00'
      formatted_transaction_three = '17/7/2018 ||  || 12.00 || 263.00'

      allow(transaction_formatter_double).to receive(:create_format).and_return(formatted_transaction_one, formatted_transaction_two, formatted_transaction_three)

      expect(statement.format_statement).to eq "date || credit || debit || balance\n17/7/2018 ||  || 12.00 || 263.00\n16/7/2018 || 125.00 ||  || 275.00\n15/7/2018 || 50.00 ||  || 150.00"
    end
  end
end
