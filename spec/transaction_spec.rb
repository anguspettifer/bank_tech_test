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
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)
      transaction = described_class.new(account_double, date_double)
      transaction.deposit(50)
      expect(transaction.details).to eq ["16-JUL-2018", :credit, 50]
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
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)
      transaction = described_class.new(account_double, date_double)
      transaction.withdraw(50)
      expect(transaction.details).to eq ["16-JUL-2018", :debit, 50]
    end

  end

end
