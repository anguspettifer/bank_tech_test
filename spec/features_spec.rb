require 'account'
require 'transaction'
require 'date'

describe "Feature tests:" do

  account = Account.new

  it "I can see how much cash is in my account" do
    expect(account.balance).to eq 100
  end

  it "I can deposit money" do
    account = Account.new
    transaction = Transaction.new(account)
    transaction.deposit(50)
    expect(account.balance).to eq 150
  end

  it "I can withdraw money" do
    account = Account.new
    transaction = Transaction.new(account)
    transaction.withdraw(25)
    expect(account.balance).to eq 75
  end

  it "I can view a statement of transactions" do
    account = Account.new
    transaction = Transaction.new(account)
    statement = Statement.new(transaction)
    date = formatted_date(Date.today)
    transaction.deposit(50)
    transaction.deposit(150)
    transaction.withdraw(120)
    expect(statement.view).to eq "date || credit || debit || balance\n#{date} || 50.00 ||  || 150.00\n#{date} || 150.00 ||  || 300.00\n#{date} ||  || 120.00 || 180.00"
  end

end
