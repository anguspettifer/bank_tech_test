# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'My balance is default to zero' do
      expect(account.balance).to eq 0
    end
  end

  describe '#credit' do
    it 'Updates balance by the amount given' do
      # account.credit(50)
      expect(account.credit(50)).to eq 50
    end
  end

  describe '#debit' do
    it 'Reduces balance by the amount given' do
      # account.credit(100)
      # account.debit(85)
      expect(account.debit(85)).to eq -85
    end
  end
end
