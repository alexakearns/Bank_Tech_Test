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
end
