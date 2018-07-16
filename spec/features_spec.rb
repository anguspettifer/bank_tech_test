require 'account'
require 'transaction'

describe "Feature tests:" do

  account = Account.new

  it "I can see how much cash is in my account" do
    expect(account.balance).to eq 100
  end

  it "I can credit my account" do
    account.credit(50)
    expect(account.balance).to eq 150
  end

  it "I can debit account" do
    account.debit(65)
    expect(account.balance).to eq 85
  end

  account = Account.new
  transaction = Transaction.new(account)

  it "I can view my latest transaction" do
    transaction.deposit(50)
    expect(transaction.view_latest).to eq "Date: 16-jul-18, credit: 50, balance: 150"
  end

end
