# frozen_string_literal: true

require 'client'

describe Client do
  it 'should allow client to deposit money' do
    client = Client.new
    client.deposit(100)
    expect(client.current_balance).to eq 100
  end

  it 'should allow client to withdraw money' do
    client = Client.new
    client.deposit(100)

    client.withdraw(75)
    expect(client.current_balance).to eq 25
  end

  it 'client current balance changes by amount deposited' do
    client = Client.new
    client.deposit(100)
    client.deposit(50)
    expect(client.current_balance).to eq 150
  end

  it 'client deposit adds new transaction object to history array' do
    client = Client.new
    client.deposit(100)
    expect(client.transaction_history.first).to be_an_instance_of(Transaction)
  end

  it 'each deposit or withdrawl made adds new transaction to history list' do
    client = Client.new
    client.deposit(100)
    client.deposit(200)
    client.withdraw(50)
    client.withdraw(25)
    expect(client.transaction_history.length).to eq 4
  end

  it 'deposit funds adds transaction object with credit to all transactions' do
    client = Client.new
    client.deposit(100)
    expect(client.transaction_history.first.credit).to eq 100.00
  end

  it 'withdraw funds adds transaction object with debit to all transactions' do
    client = Client.new
    client.deposit(100)
    expect(client.transaction_history.first.credit).to eq 100.00
  end

  # test needs reviewing when printer takes on responsibility of statement
  xit 'prints the transactions' do
    client = Client.new
    client.deposit(100, '12/02/2019')
    expect { client.statement }.to output(" date || credit || debit || balance \n12/02/2019 || 100.00 ||  || 100.00 \n").to_stdout
  end
end
