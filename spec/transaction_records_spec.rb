# frozen_string_literal: true

require 'transaction_records'

describe TransactionRecords do
  let(:account_double) { double :account }
  let(:date_double) { double :date }
  let(:todays_date_double) { double :todays_date }
  let(:transaction_class_double) { double :transaction_class }
  let(:transaction_double) { double :transaction }
  subject(:transaction) { described_class.new(account_double, date_double, transaction_class_double) }

  describe '#deposit' do
    before do
      allow(account_double).to receive(:balance).and_return(175)
      allow(account_double).to receive(:credit)
      allow(date_double).to receive(:today).and_return(todays_date_double)
      allow(transaction_class_double).to receive(:new).and_return(transaction_double)
    end

    it 'Deposits money into account' do
      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

    it 'Negative money cannot be deposited' do
      message = 'Can only facilitate positive integer'
      expect { transaction.deposit(-50) }.to raise_error message
    end

    it 'Updates the transaction details' do
      transaction.deposit(75)
      expect(transaction.details).to eq [transaction_double]
    end
  end

  describe '#withdraw' do
    before do
      allow(account_double).to receive(:balance).and_return(60)
      allow(account_double).to receive(:debit)
      allow(date_double).to receive(:today).and_return(todays_date_double)
      allow(transaction_class_double).to receive(:new).and_return(transaction_double)
    end

    it 'Withdraws money from account' do
      expect(account_double).to receive(:debit).with(25)
      transaction.withdraw(25)
    end

    it 'Negative money cannot be withdrawn' do
      message = 'Can only facilitate positive integer'
      expect { transaction.withdraw(-50) }.to raise_error message
    end

    it 'Updates the transaction details' do
      transaction.withdraw(40)
      expect(transaction.details).to eq [transaction_double]
    end
  end
end
