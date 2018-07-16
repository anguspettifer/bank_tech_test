require 'transaction'

# book = instance_double("Book", :pages => 250)


describe Transaction do

  describe "#deposit" do

    it "I can update the balance in my account" do

      account_double = instance_double("Account", :deposit)
      transaction = described_class.new(account_double)

      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

  end

end
