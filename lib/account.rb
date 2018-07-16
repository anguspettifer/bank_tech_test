class Account
  attr_reader :balance
  STARTING_BALANCE = 100

  def initialize
    @balance = STARTING_BALANCE
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

end
