# frozen_string_literal: true

require 'client'

describe Client do
  it 'should have an initial balance of 0' do
    expect(subject.current_balance).to eq 0
  end

  it 'should deposit funds and increase current balance' do
    subject.deposit(100)
    expect(subject.current_balance).to eq 100
  end

  it 'should withdraw funds and decrease current balance' do
    subject.deposit(100)

    subject.withdraw(75)
    expect(subject.current_balance).to eq 25
  end

  it 'has empty all transactions list' do
    expect(subject.all_transactions).to eq []
  end

  it 'stores deposits and withdrawals in all transaction list' do
    subject.deposit(100, the_date)
    subject.withdraw(25, the_date)
    subject.deposit(10, the_date)
    expect(subject.all_transactions.first.balance).to eq 85
  end

  it 'adds deposit transaction object to all transaction array' do
    subject.deposit(100, the_date)
    expect(subject.all_transactions.first).to be_an_instance_of(Transaction)
  end

  it 'deposit funds adds transaction object with credit to all transactions' do
    subject.deposit(100, date: the_date)
    expect(subject.all_transactions.last.credit).to eq 100.00
  end

  xit 'prints transaction' do
    subject.deposit(100)
    expect(subject.statement).to eq '100.00 || 100.00 || '
  end
end

def the_date
  return Time.now.strftime('%d/%m/%Y')
end
