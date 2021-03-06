# frozen_string_literal: true

require 'transaction'


describe Transaction do

  let(:todays_date_double) {
    double :todays_date,
    day: 17,
    month: 7,
    year: 2018
   }


  subject(:transaction) { described_class.new({
      type: :credit,
      amount: 53,
      balance: 103
    }, todays_date_double) }

  describe '#date' do
    it 'returns date of transaction' do
      expect(transaction.date).to eq "17/7/2018"
    end
  end

  describe '#type' do
    it 'Returns the type of transaction' do
      expect(transaction.type).to eq :credit
    end
  end

  describe '#ammount' do
    it 'Returns the ammount transacted' do
      expect(transaction.amount).to eq 53
    end
  end

  describe '#new_balance' do
    it 'Returns the new balance' do
      expect(transaction.balance).to eq 103
    end
  end
end
