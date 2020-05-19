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

  it 'stores deposit in all transaction list' do
    subject.deposit((100))
    expect(subject.all_transactions).to eq [100]
  end
end
