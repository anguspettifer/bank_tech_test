require 'account'
require 'transaction'

describe "Feature tests:" do

  account = Account.new

  it "I can see how much cash is in my account" do
    expect(account.balance).to eq 100
  end

  it "I can deposit cash in my account" do
    account.deposit(50)
    expect(account.balance).to eq 150
  end

  it "I can withdraw cash from my account" do
    account.withdraw(65)
    expect(account.balance).to eq 85
  end

  account = Account.new
  transaction = Transaction.new(account)

  it "I can view my latest transaction" do
    transaction.deposit(50)
    expect(transaction.view_latest).to eq "Date: 16-jul-18, credit: 50, balance: 150"
  end

end
