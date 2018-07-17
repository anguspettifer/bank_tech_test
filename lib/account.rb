class Account
  attr_reader :balance
  STARTING_BALANCE = 100

  def initialize
    @balance = STARTING_BALANCE
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end

end
