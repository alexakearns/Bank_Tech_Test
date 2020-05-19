# frozen_string_literal: true

require 'transaction'

describe Transaction do

  it 'should initialise with balance properties' do
    transaction = Transaction.new(100, 50) 
    expect(transaction.balance).to eq 100
  end

  it 'should initialise with credit properties' do
    transaction = Transaction.new(100, 50) 
    expect(transaction.credit).to eq 50
  end

  it 'should initialise with credit properties' do
    transaction = Transaction.new(100, 0, 25) 
    expect(transaction.debit).to eq 25
  end
end
