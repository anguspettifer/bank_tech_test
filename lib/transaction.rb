class Transaction

  def initialize(account)
    @account = account
  end

  def deposit(ammount)
    @account.deposit(50)
  end

end
