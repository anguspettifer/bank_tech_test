require 'transaction'

# book = instance_double("Book", :pages => 250)


describe Transaction do

  describe "#deposit" do

    it "I can deposit money into my account" do
      account_double = instance_double("Account", :deposit)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

  end

  describe "#withdraw" do

    it "I can withdraw money from my account" do
      account_double = instance_double("Account", :withdraw)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:debit).with(25)
      transaction.withdraw(25)
    end

  end

end
