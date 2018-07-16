class Transaction

  def initialize(account)
    @account = account
  end

  def deposit(ammount)
    @account.credit(ammount)
  end

  def withdraw(ammount)
    @account.debit(ammount)
  end

end
