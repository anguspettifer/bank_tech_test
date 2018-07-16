require 'account'

describe Account do

  account = described_class.new

  describe "#balance" do
    it "I can see how much cash is in my account" do
      expect(account.balance).to eq 100
    end
  end

  describe "#deposit" do
    it "updates balance by the ammount given" do
      account.deposit(50)
      expect(account.balance).to eq 150
    end
  end

  describe "#withdraw" do
    it "withdraws balance by the ammount given" do
      account.withdraw(125)
      expect(account.balance).to eq 25
    end
  end

end
