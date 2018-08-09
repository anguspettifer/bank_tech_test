# frozen_string_literal: true

require 'transaction'


describe Transaction do

  let(:todays_date_double) {
    double :todays_date,
    day: 17,
    month: 7,
    year: 2018
   }


  subject(:transaction) { described_class.new(:type, :amount, :balance, todays_date_double) }

  describe '#date' do
    it 'returns date of transaction' do
      expect(transaction.date).to eq "17/7/2018"
    end
  end

  describe '#type' do
    it 'Returns the type of transaction' do
      expect(transaction.type).to eq :type
    end
  end

  describe '#ammount' do
    it 'Returns the ammount transacted' do
      expect(transaction.amount).to eq :amount
    end
  end

  describe '#new_balance' do
    it 'Returns the new balance' do
      expect(transaction.balance).to eq :balance
    end
  end
end
