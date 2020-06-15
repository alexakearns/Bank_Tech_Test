Bank Tech Test
===
---

Bank tech test is a small project as part of Week 10 at Makers Academy. [Bank Tech Test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

The aim of this project is to produce well tested, easy to read and easy to change code that is produced through a structured process using TDD and good object orientated design.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Planning

### Domain Model

| Object         | Message                          |
|----------------|----------------------------------|
| Client         | Balance, Deposit, Withdraw       |
| Transaction    | Credit, Debit, Date, Display     |
| Printer        | Print statement                  |


### User Stories

```
As a client, 
So I can keep track of my money,
I would like to have be able to see my current balance.

As a client,
So I can see how much money I have available,
I would like to deposit funds and my balance to reflect this.

As a client,
So I can spend my money,
I would like to to withdraw funds and my balance to reflect.

As a client,
So I can see when I deposited or withdraw money,
I would like to keep a history of my transactions.

As a client,
So I can when I deposited and withdrew money,
I would like to see my transactions with a date.

As a client,
So I can see all my transactions
I would like to be able to print out a statement.

As a client,
So I can easily see my latest transactions,
I would like my statement to print with my latest transaction at the top.

```


## Quick Start:
1. Clone repo  
2. Install dependencies using: 
```
bundle
```
3. Run tests using:
```
rspec
```
4. To run linter
```
Rubocop
```
5. Run in irb
```
$ irb
:001 > require './lib/client'
:002 > client = Client.new
:003 > client.deposit(1000)
:004 > client.deposit(2000)
:005 > client.withdraw(500)
:006 > client.statement
```

<img src="https://github.com/alexakearns/bank_tech_test/blob/master/images/Screenshot%202020-05-20%20at%2017.53.52.png">

## Approach
---
All direct interaction of my code is through the client as the user of this application.  
Each time they #deposit or #withdraw fund, a new instance of Transaction is created.  
As initiation, the updated balance, credit/debit and the date of the transaction are stored in that instance as well as being able to format how it would be displayed.  
Each Transaction instance is stored in an array in the Client.  
To print the statement including all Transactions, a Printer instance uses the Clients array, each Transactions display and provides a statement for the Client.