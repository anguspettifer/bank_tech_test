require 'account'

describe Account do

  it "I can see how much cash is in my account" do
    expect(subject.balance).to eq 100
  end

  it "I can deposit cash in my account" do
    subject.deposit(50)
    expect(subject.balance).to eq 150
  end

end
