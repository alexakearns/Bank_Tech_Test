# frozen_string_literal: true

require 'account'

describe Account do
  it 'change balance when account receives credit' do
    account = Account.new
    account.credit(50)
    expect(account.current_balance).to eq 50
  end

  it 'changes balance when account receives debit' do
    account = Account.new
    account.debit(25)
    expect(account.current_balance).to eq -25
  end

  it '#credit should add new transaction object to history array' do
    account = Account.new
    account.credit(100)
    expect(account.transaction_history.first).to be_an_instance_of(Transaction)
  end

  it '#debit should add new transaction object to history array' do
    account = Account.new
    account.debit(50)
    expect(account.transaction_history.first).to be_an_instance_of(Transaction)
  end

  it '#credit and #debit adds multiple transactions to history' do
    account = Account.new
    account.credit(100)
    account.debit(50)
    account.debit(25)
    account.credit(200)
    expect(account.transaction_history.length).to eq 4
  end
end
