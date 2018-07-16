require 'transaction'

describe Transaction do

  describe "#deposit" do

    it "I can deposit money into my account" do
      account_double = instance_double("Account", :credit)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:credit).with(50)
      transaction.deposit(50)
    end

    it "Updates the transaction details" do
      account_double = instance_double("Account")
      allow(account_double).to receive(:credit).with(50)
      date_double = double("Date")
      todays_date_double = double("today's date")
      allow(date_double).to receive(:today).and_return(todays_date_double)
      transaction = described_class.new(account_double, date_double)
      transaction.deposit(50)
      expect(transaction.details).to eq [todays_date_double, :credit, 50]
    end

  end

  describe "#withdraw" do

    it "I can withdraw money from my account" do
      account_double = instance_double("Account", :withdraw)
      transaction = described_class.new(account_double)
      expect(account_double).to receive(:debit).with(25)
      transaction.withdraw(25)
    end

    it "Updates the transaction details" do
      account_double = instance_double("Account")
      allow(account_double).to receive(:debit).with(50)
      date_double = double("Date")
      todays_date_double = double("today's date")
      allow(date_double).to receive(:today).and_return(todays_date_double)
      transaction = described_class.new(account_double, date_double)
      transaction.withdraw(50)
      expect(transaction.details).to eq [todays_date_double, :debit, 50]
    end

  end

end
