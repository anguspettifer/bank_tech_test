# Bank tech test

An application that allows a user to deposit and withdraw money, and view their transaction history.

[Getting started](#getting-started)  | [My process](#my-process)


## Getting started

* Fork this repo and clone to your local machine
* Navigate to the root directory

```
> bundle install
> irb
> require './irb.rb'
```
* This automatically creates an account with a balance of zero
```
> @transaction.deposit(1000)
> @transaction.deposit(2000)
> @transaction.withdraw(500)
> puts @statement.view
```
I won't spoil the surprise!

If you run this programme over several days, you will note the change in date of transactions.

#### Running tests:

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
2. Diagram
<img src="/assets/images/diagram_bank_tech_test.png" width="750px" />

3. TDD
- Feature test account
- Unit test account
- Refactor
- Expand feature test suite to include transaction
- Unit test transaction, injecting and stubbing account and time behaviour
- Expand feature test suite to include statement
- Refactor
- Unit test statement, injecting and stubbing transaction and time behaviour
- Extract relevant behaviour from transaction into statement
- Refactor
- Refactor test suite

4.
- Check alignment with initial criteria
- TDD minor adjustments

5.
- Make user-friendly IRB file

6.
- Test 'unhappy' path
