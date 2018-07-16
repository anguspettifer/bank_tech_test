class Transaction

  def initialize(account)
    @account = account
  end

  def deposit(ammount)
    @account.credit(50)
  end

end
