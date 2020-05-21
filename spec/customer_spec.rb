# frozen_string_literal: true

require 'customer'

describe Customer do
  it 'should have an initial balance of 0' do
    customer = Customer.new
    expect(customer.current_balance).to eq 0
  end

  it 'should deposit funds and increase current balance' do
    customer = Customer.new
    customer.deposit(100)
    expect(customer.current_balance).to eq 100
  end

  it 'should withdraw funds and decrease current balance' do
    customer = Customer.new
    customer.deposit(100)

    customer.withdraw(75)
    expect(customer.current_balance).to eq 25
  end

  it 'has empty all transactions list' do
    customer = Customer.new
    expect(customer.all_transactions).to eq []
  end

  it 'stores deposits and withdrawals in all transaction list' do
    customer = Customer.new
    customer.deposit(100, the_date)
    customer.withdraw(25, the_date)
    customer.deposit(10, the_date)
    expect(customer.all_transactions.first.balance).to eq 85
  end

  it 'adds deposit transaction object to all transaction array' do
    customer = Customer.new
    customer.deposit(100, the_date)
    expect(customer.all_transactions.first).to be_an_instance_of(Transaction)
  end

  it 'deposit funds adds transaction object with credit to all transactions' do
    customer = Customer.new
    customer.deposit(100, date: the_date)
    expect(customer.all_transactions.last.credit).to eq 100.00
  end

  it 'prints the transactions' do
    customer = Customer.new
    customer.deposit(100, "12/02/2019")
    expect { customer.statement }.to output(" date || credit || debit || balance \n12/02/2019 || 100.00 ||  || 100.00 \n").to_stdout
  end
end

def the_date
  Time.now.strftime('%d/%m/%Y')
end
