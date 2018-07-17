# Bank tech test

An application that allows a user to deposit and withdraw money, and view their transaction history.

[Getting started](#getting-started)  | [My process](#my-process)


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

## My process

1. Creation of user stories

```
As a customer
So that I can check how much cash I have
I would like to be able to view my balance
```
```
As a customer
So that I store my cash in a safe place
I would like to deposit money
```
```
As a customer
So that I can pay for a great coding course
I would like to withdraw money
```
```
As a customer
So that I can keep my finances in order
I would like to view my transaction history
```
2. Initial diagram
<img src="/assets/images/diagram_bank_tech_test.png" width="750px" />

3. TDD
- Feature test account
- Unit test account
- Expand feature test suite to include transaction
- Unit test transaction, injecting and stubbing account behaviour
- Expand feature test suite to include statement
- Unit test statement, injecting and stubbing transaction behaviour
- Extract relevant behaviour from transaction into statement
