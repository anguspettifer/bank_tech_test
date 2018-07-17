require_relative './lib/account.rb'
require_relative './lib/transaction.rb'
require_relative './lib/statement.rb'

@account = Account.new
@transaction = Transaction.new(@account)
@statement = Statement.new(@transaction)
