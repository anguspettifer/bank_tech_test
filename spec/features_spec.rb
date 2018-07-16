require 'account'
require 'transaction'

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

  it "I can view my latest transaction" do
    account = Account.new
    transaction = Transaction.new(account)
    statement = Statement.new(transaction, account)
    transaction.deposit(50)
    expect(statement.view_latest).to eq "Date: 16-JUL-2018, credit: 50, balance: 150"
  end

end
