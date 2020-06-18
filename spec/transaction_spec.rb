# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'should display deposit transaction' do
    date = Time.new(2019, 2, 5)
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(balance: 100, credit: 40)

    expect(transaction.display).to eq '05/02/2019 || 40.00 ||  || 100.00 '
  end

  it 'should display withdraw transaction' do
    date = Time.new(2019, 2, 5)
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(balance: 100, debit: 30)

    expect(transaction.display).to eq '05/02/2019 ||  || 30.00 || 100.00 '
  end

  it 'should display date of transaction' do
    date = Time.new(2019, 2, 5)
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(balance: 100, credit: 50)

    expect(transaction.display).to eq '05/02/2019 || 50.00 ||  || 100.00 '
  end
end
