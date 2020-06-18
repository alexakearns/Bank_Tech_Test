# frozen_string_literal: true

require 'customer'

describe Customer do
  it 'should allow customer to deposit money' do
    customer = Customer.new
    customer.deposit(100)
    expect(customer.current_balance).to eq 100
  end

  it 'should allow customer to withdraw money' do
    customer = Customer.new
    customer.deposit(100)

    customer.withdraw(75)
    expect(customer.current_balance).to eq 25
  end

  it 'customer current balance changes by amount deposited' do
    customer = Customer.new
    customer.deposit(100)
    customer.deposit(50)
    expect(customer.current_balance).to eq 150
  end

  it 'customer deposit adds new transaction object to history array' do
    customer = Customer.new
    customer.deposit(100)
    expect(customer.transaction_history.first).to be_an_instance_of(Transaction)
  end

  it 'each deposit or withdrawl made adds new transaction to history list' do
    customer = Customer.new
    customer.deposit(100)
    customer.deposit(200)
    customer.withdraw(50)
    customer.withdraw(25)
    expect(customer.transaction_history.length).to eq 4
  end

  it 'deposit funds adds transaction object with credit to all transactions' do
    customer = Customer.new
    customer.deposit(100)
    expect(customer.transaction_history.first.credit).to eq 100.00
  end

  it 'withdraw funds adds transaction object with debit to all transactions' do
    customer = Customer.new
    customer.deposit(100)
    expect(customer.transaction_history.first.credit).to eq 100.00
  end

  # test needs reviewing when printer takes on responsibility of statement
  xit 'prints the transactions' do
    customer = Customer.new
    customer.deposit(100, '12/02/2019')
    expect { customer.statement }.to output(" date || credit || debit || balance \n12/02/2019 || 100.00 ||  || 100.00 \n").to_stdout
  end
end
