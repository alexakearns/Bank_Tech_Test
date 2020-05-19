# frozen_string_literal: true

require 'transaction'

describe Transaction do

  it 'should initialise with balance properties' do
    transaction = Transaction.new(balance: 100, credit: 50) 
    expect(transaction.balance).to eq 100
  end

  it 'should initialise with credit properties' do
    transaction = Transaction.new(balance: 100, credit: 50) 
    expect(transaction.credit).to eq 50
  end

  it 'should initialise with debit properties' do
    transaction = Transaction.new(balance: 100, debit: 25) 
    expect(transaction.debit).to eq 25
  end

  it 'should display deposit transaction' do
    transaction = Transaction.new(balance: 100, credit: 40)
    expect(transaction.display).to eq '100 || 40 || '
  end

  it 'should display withdraw transaction' do
    transaction = Transaction.new(balance:100, debit: 30)
    expect(transaction.display).to eq '100 ||  || 30'
  end
    


end
