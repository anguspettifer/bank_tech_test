require 'account'

describe Account do

  it "I can see how much cash is in my account" do
    expect(subject.balance).to eq 100
  end

  describe "#deposit" do
    it "updates balance by the ammount given" do
      subject.deposit(50)
      expect(subject.balance).to eq 150
    end
  end

end
