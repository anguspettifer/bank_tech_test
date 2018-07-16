require 'account'

describe Account do

  it "I can see how much cash is in my account" do
    expect(subject.balance).to eq 100
  end

end
