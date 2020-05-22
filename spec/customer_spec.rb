# frozen_string_literal: true

require 'customer'

describe Customer do

  it 'should allow customer to deposit money' do
    # customer = Customer.new
    # customer.deposit(100)
    # expect(customer.current_balance).to eq 100
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

  # test needs reviewing when printer takes on responsibility of statement
  xit 'prints the transactions' do
    customer = Customer.new
    customer.deposit(100, '2/02/2019')
    expect { customer.statement }.to output(" date || credit || debit || balance \n12/02/2019 || 100.00 ||  || 100.00 \n").to_stdout
  end
end
