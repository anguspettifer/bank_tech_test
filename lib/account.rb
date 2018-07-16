class Account
  attr_reader :balance

  def initialize
    STARTING_BALANCE = 100
    @balance = STARTING_BALANCE
  end

end
