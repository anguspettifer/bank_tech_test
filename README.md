# Bank tech test

An application that allows a user to deposit and withdraw money, and view their transaction history.

[Getting started](#getting-started) | [User Stories](#user-stories) | [Process](#process)

## Getting started

Clone this repo
Run `bundle`
Run `irb`
Create an account `account = Account.new`
Your starting balance is £100, its a bonus for signing up to this fantastic bank account
Deposit/withdraw money:
`transaction = Transaction.new(account)`
`transaction.deposit(50)`
`transaction.withdraw(100)`
View transactions:

## Getting started

* Fork this repo and clone to your local machine

```
> bundle install
> irb
```
Your starting balance is £100, its a bonus for signing up to this fantastic bank account
```
> account = Account.new
> transaction = Transaction.new(account)
> transaction.deposit(50)
> transaction.withdraw(100)
> statement = Statement.new(transaction)
> statement.view
```
I won't spoil the surprise!

Running tests

Run
``` rspec ```
from the root directory

## User Stories

<img src="/assets/images/diagram_bank_tech_test.png" width="750px" />

## Process
