class Account
  attr_reader :balance
  STARTING_BALANCE = 100

  def initialize
    @balance = STARTING_BALANCE
  end

  def credit(ammount)
    @balance += ammount
  end

  def debit(ammount)
    @balance -= ammount
  end

end
