require 'statement'

describe Statement do

  describe "#view_latest" do

    it "Returns latest transaction" do
      transaction_double = instance_double("Transaction", :details => ["16-JUL-2018", :credit, 50])
      account_double = instance_double("Account", :balance => 150)
      statement = described_class.new(transaction_double, account_double)
      expect(statement.view_latest).to eq "Date: 16-JUL-2018, credit: 50, balance: 150"
    end

  end

end


# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00
