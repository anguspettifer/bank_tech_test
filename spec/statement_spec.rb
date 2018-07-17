# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:todays_date_double) { double :todays_date }
  let(:yesterdays_date_double) { double :yestdays_date }

  let(:transaction_record_double) { double :transaction_record }
  let(:transaction_one_double) { double :transaction_one }
  let(:transaction_two_double) { double :transaction_two }
  let(:transaction_three_double) { double :transaction_three }

  let(:formatted_transaction_class_double) { double :formatted_transaction_class }
  let(:formatted_transaction_double) { double :formatted_transaction }

  subject(:statement) { described_class.new(transaction_record_double, formatted_transaction_class_double) }

  describe '#view' do
    it 'Returns statement in user friendly format' do
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)

      allow(yesterdays_date_double).to receive(:day).and_return(15)
      allow(yesterdays_date_double).to receive(:month).and_return(7)
      allow(yesterdays_date_double).to receive(:year).and_return(2018)

      allow(transaction_record_double).to receive(:transactions).and_return([transaction_one_double, transaction_two_double, transaction_three_double])

      formatted_transaction_one = '15/7/2018 || 50.00 ||  || 150.00'
      formatted_transaction_two = '16/7/2018 || 125.00 ||  || 275.00'
      formatted_transaction_three = '17/7/2018 ||  || 12.00 || 263.00'

      allow(formatted_transaction_class_double).to receive(:new).and_return(formatted_transaction_double)

      allow(formatted_transaction_double).to receive(:create_format).and_return(formatted_transaction_one, formatted_transaction_two, formatted_transaction_three)

      expect(statement.view).to eq "date || credit || debit || balance\n17/7/2018 ||  || 12.00 || 263.00\n16/7/2018 || 125.00 ||  || 275.00\n15/7/2018 || 50.00 ||  || 150.00"
    end
  end
end
