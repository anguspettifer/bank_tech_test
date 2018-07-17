# frozen_string_literal: true

require 'account'
require 'transaction_records'
require 'date'

describe 'Feature tests:' do
  describe 'account balance' do
    it 'I can see how much cash is in my account' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

  describe 'transaction_records' do
    it 'I can deposit money' do
      account = Account.new
      transaction_records = TransactionRecords.new(account)
      transaction_records.deposit(60)
      expect(account.balance).to eq 60
    end

    it 'I can withdraw money' do
      account = Account.new
      transaction_records = TransactionRecords.new(account)
      transaction_records.deposit(100)
      transaction_records.withdraw(25)
      expect(account.balance).to eq 75
    end
  end

  describe 'statement' do
    it 'I can view a statement of transaction_records' do
      account = Account.new
      transaction_records = TransactionRecords.new(account)
      statement = Statement.new(transaction_records)
      date = formatted_date(Date.today)
      transaction_records.deposit(50)
      transaction_records.deposit(150)
      transaction_records.withdraw(120)
      expect(statement.view).to eq "date || credit || debit || balance\n#{date} ||  || 120.00 || 80.00\n#{date} || 150.00 ||  || 200.00\n#{date} || 50.00 ||  || 50.00"
    end
  end
end
