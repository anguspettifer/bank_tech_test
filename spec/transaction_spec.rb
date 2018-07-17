# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#deposit' do
    it 'I can deposit money into my account' do
      account_double = instance_double('Account', :credit)
      allow(account_double).to receive(:balance)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

    it 'Updates the transaction details' do
      account_double = instance_double('Account')
      allow(account_double).to receive(:credit).with(75)
      allow(account_double).to receive(:balance).and_return(175)
      date_double = double('Date')
      todays_date_double = double("today's date")
      allow(date_double).to receive(:today).and_return(todays_date_double)
      transaction = described_class.new(account_double, date_double)
      transaction.deposit(75)
      expect(transaction.details).to eq [[todays_date_double, :credit, 75, 175]]
    end
  end

  describe '#withdraw' do
    it 'I can withdraw money from my account' do
      account_double = instance_double('Account', :withdraw)
      allow(account_double).to receive(:balance)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:debit).with(25)
      transaction.withdraw(25)
    end

    it 'Updates the transaction details' do
      account_double = instance_double('Account')
      allow(account_double).to receive(:debit).with(40)
      allow(account_double).to receive(:balance).and_return(60)
      date_double = double('Date')
      todays_date_double = double("today's date")
      allow(date_double).to receive(:today).and_return(todays_date_double)
      transaction = described_class.new(account_double, date_double)
      transaction.withdraw(40)
      expect(transaction.details).to eq [[todays_date_double, :debit, 40, 60]]
    end
  end
end
