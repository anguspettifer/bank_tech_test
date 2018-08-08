# frozen_string_literal: true

require 'transaction_formatter'

describe TransactionFormatter do
  let(:transaction_double) {
    double :transaction,
    date: "17/7/2018",
    type: :credit,
    amount: 50,
    balance: 100
  }

  subject(:transaction_formatter) { described_class.new }

  describe '#create_format' do
    it 'Formats a transaction' do
      expect(transaction_formatter.create_format(transaction_double)).to eq '17/7/2018 || 50.00 ||  || 100.00'
    end
  end
end
