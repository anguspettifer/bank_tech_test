# frozen_string_literal: true

# Understands how to store money
class Account
  attr_reader :balance
  STARTING_BALANCE = 0

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
