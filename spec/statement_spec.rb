# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:todays_date_double) { double :todays_date }
  let(:yesterdays_date_double) { double :yestdays_date }
  let(:transaction_double) { double :transaction }
  subject(:statement) { described_class.new(transaction_double) }

  describe '#view' do
    it 'Returns statement' do
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)

      allow(yesterdays_date_double).to receive(:day).and_return(15)
      allow(yesterdays_date_double).to receive(:month).and_return(7)
      allow(yesterdays_date_double).to receive(:year).and_return(2018)

      allow(transaction_double).to receive(:details).and_return([[yesterdays_date_double, :credit, 50, 150], [todays_date_double, :credit, 125, 275], [todays_date_double, :debit, 12, 263]])

      expect(statement.view).to eq "date || credit || debit || balance\n16-JUL-2018 ||  || 12.00 || 263.00\n16-JUL-2018 || 125.00 ||  || 275.00\n15-JUL-2018 || 50.00 ||  || 150.00"
    end
  end
end
