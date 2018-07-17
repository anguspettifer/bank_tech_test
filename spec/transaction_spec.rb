# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(:date, :type, :amount, :balance) }

  describe '#date' do
    it "returns date of transaction" do
      expect(transaction.date).to eq :date
    end
  end

  describe '#type' do
    it "Returns the type of transaction" do
      expect(transaction.type).to eq :type
    end
  end

  describe '#ammount' do
    it "Returns the ammount transacted" do
      expect(transaction.amount).to eq :amount
    end
  end

  describe '#new_balance' do
    it "Returns the new balance" do
      expect(transaction.balance).to eq :balance
    end
  end
end
