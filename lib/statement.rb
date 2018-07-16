class Statement

  def initialize(transaction, account)
    @transaction = transaction
    @account = account
  end

  def view_latest
    array = @transaction.details
    balance = @account.balance
    "Date: #{array[0]}, #{array[1]}: #{array[2]}, balance: #{balance}"
  end

end
