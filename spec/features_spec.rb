# frozen_string_literal: true

require 'account'
require 'transaction'
require 'date'

describe 'Feature tests:' do
  describe 'account balance' do
    it 'I can see how much cash is in my account' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

  describe 'transaction' do
    it 'I can deposit money' do
      account = Account.new
      transaction = Transaction.new(account)
      transaction.deposit(60)
      expect(account.balance).to eq 60
    end

    it 'I can withdraw money' do
      account = Account.new
      transaction = Transaction.new(account)
      transaction.deposit(100)
      transaction.withdraw(25)
      expect(account.balance).to eq 75
    end
  end

  describe 'statement' do
    it 'I can view a statement of transactions' do
      account = Account.new
      transaction = Transaction.new(account)
      statement = Statement.new(transaction)
      date = formatted_date(Date.today)
      transaction.deposit(50)
      transaction.deposit(150)
      transaction.withdraw(120)
      expect(statement.view).to eq "date || credit || debit || balance\n#{date} || 50.00 ||  || 50.00\n#{date} || 150.00 ||  || 200.00\n#{date} ||  || 120.00 || 80.00"
    end
  end
end
