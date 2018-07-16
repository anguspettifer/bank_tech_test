require 'account'

describe "Feature tests:" do

  account = Account.new

  it "I can see how much cash is in my account" do
    expect(account.balance).to eq 100
  end

  it "I can deposit cash in my account" do
    account.deposit(50)
    expect(account.balance).to eq 150
  end

end
