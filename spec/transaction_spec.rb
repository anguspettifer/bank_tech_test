# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:account_double) { double :account }
  let(:date_double) { double :date }
  let(:todays_date_double) { double :todays_date }
  subject(:transaction) { described_class.new(account_double, date_double) }

  describe '#deposit' do
    before do
      allow(account_double).to receive(:balance).and_return(175)
      allow(account_double).to receive(:credit)
      allow(date_double).to receive(:today).and_return(todays_date_double)
    end

    it 'Deposits money into account' do
      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

    it 'Negative money cannot be deposited' do
      message = "Can only facilitate positive integer"
      expect { transaction.deposit(-50) }.to raise_error message
    end

    it 'Updates the transaction details' do
      transaction.deposit(75)
      expect(transaction.details).to eq [[todays_date_double, :credit, 75, 175]]
    end
  end

  describe '#withdraw' do
    before do
      allow(account_double).to receive(:balance).and_return(60)
      allow(account_double).to receive(:debit)
      allow(date_double).to receive(:today).and_return(todays_date_double)
    end

    it 'Withdraws money from account' do
      expect(account_double).to receive(:debit).with(25)
      transaction.withdraw(25)
    end

    it 'Negative money cannot be withdrawn' do
      message = "Can only facilitate positive integer"
      expect { transaction.withdraw(-50) }.to raise_error message
    end

    it 'Updates the transaction details' do
      transaction.withdraw(40)
      expect(transaction.details).to eq [[todays_date_double, :debit, 40, 60]]
    end
  end
end
