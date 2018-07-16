require 'statement'

describe Statement do

  describe "#view_latest" do

    it "Returns latest transaction" do
      todays_date_double = double("today's date")
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)
      transaction_double = instance_double("Transaction", :details => [[todays_date_double, :credit, 50, 150]])
      statement = described_class.new(transaction_double)
      expect(statement.view_latest).to eq "Date: 16-JUL-2018, credit: 50, balance: 150"
    end

    it "Returns statement" do
      todays_date_double = double("today's date")
      allow(todays_date_double).to receive(:day).and_return(16)
      allow(todays_date_double).to receive(:month).and_return(7)
      allow(todays_date_double).to receive(:year).and_return(2018)

      yesterdays_date_double = double("yesterday's date")
      allow(yesterdays_date_double).to receive(:day).and_return(15)
      allow(yesterdays_date_double).to receive(:month).and_return(7)
      allow(yesterdays_date_double).to receive(:year).and_return(2018)

      transaction_double = instance_double("Transaction", :details => [ [yesterdays_date_double, :credit, 50, 150],[todays_date_double, :credit, 125, 275], [todays_date_double, :debit, 12, 263]])
      statement = described_class.new(transaction_double)
      expect(statement.view).to eq "date || credit || debit || balance\n15-JUL-2018 || 50.00 ||  || 150.00\n16-JUL-2018 || 125.00 ||  || 275.00\n16-JUL-2018 ||  || 12.00 || 263.00"

    end

  end

end
