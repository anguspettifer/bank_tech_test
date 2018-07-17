# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'My balance is default to zerio' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'updates balance by the ammount given' do
      account.credit(50)
      expect(account.balance).to eq 50
    end
  end

  describe '#withdraw' do
    it 'withdraws balance by the ammount given' do
      account.credit(100)
      account.debit(85)
      expect(account.balance).to eq 15
    end
  end
end
