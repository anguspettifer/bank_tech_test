# frozen_string_literal: true

require 'formatted_transaction'

describe FormattedTransaction do
  let(:transaction_double) { double :transaction }
  let(:todays_date_double) { double :todays_date }

  subject(:formatted_trasaction) { described_class.new(transaction_double) }

  describe '#create_format' do
    it 'Formats a transaction' do
      allow(transaction_double).to receive(:date).and_return(todays_date_double)
      allow(transaction_double).to receive(:type).and_return(:credit)
      allow(transaction_double).to receive(:amount).and_return(50)
      allow(transaction_double).to receive(:balance).and_return(100)

      allow(todays_date_double).to receive(:day).and_return(17)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)

      expect(formatted_trasaction.create_format).to eq '17/7/2018 || 50.00 ||  || 100.00'
    end
  end
end
