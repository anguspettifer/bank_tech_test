# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:todays_date_double) { double :todays_date }
  let(:yesterdays_date_double) { double :yestdays_date }

  let(:transaction_record_double) { double :transaction_record }
  let(:transaction_one_double) { double :transaction_one }
  let(:transaction_two_double) { double :transaction_two }
  let(:transaction_three_double) { double :transaction_three }

  let(:formatted_transaction_class_double) { double :formatted_transaction_class}

  subject(:statement) { described_class.new(transaction_record_double) }

  describe '#view' do
    it 'Returns statement in user friendly format' do
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)

      allow(yesterdays_date_double).to receive(:day).and_return(15)
      allow(yesterdays_date_double).to receive(:month).and_return(7)
      allow(yesterdays_date_double).to receive(:year).and_return(2018)

      allow(transaction_record_double).to receive(:transactions).and_return([transaction_one_double, transaction_two_double, transaction_three_double])

      allow(formatted_transaction_class).to receive(:new).and_return


        [[yesterdays_date_double, :credit, 50, 150], [todays_date_double, :credit, 125, 275], [todays_date_double, :debit, 12, 263]])

      expect(statement.view).to eq "date || credit || debit || balance\n16-JUL-2018 ||  || 12.00 || 263.00\n16-JUL-2018 || 125.00 ||  || 275.00\n15-JUL-2018 || 50.00 ||  || 150.00"
    end
  end
end


# What am I trying to test here?
# I want to check that view, calls the format(transaction) method, and that it works
# format(transaction_record) takes transaction_record, whatever that is, calls details, which should return an array of transaction objects.
#
# task 1
# Consequently we do need to mock this with several transaction objects.
#
# each transaction is then fed into the FormattedTransaction class which returns some formatting
#
# task 2
# We will need to inject FormattedTransaction transaction as a class to do this
#

# I am stuck on 'and return' because I haven't built the real method yet. lets do that now and come back

# task 3
# Format HEADER
