# frozen_string_literal: true

require 'customer'

describe Customer do

  describe 'deposit' do
    # let(:account) { double("account double", :credit) }

    xit 'credits account when customer deposits amount' do
      account_class = double('account_class', :credit => 100)
      customer = Customer.new
      allow(account_class).to receive(:credit).with(100)
      customer.deposit(100)
      expect(account_class).to receive(:credit)
    end

    it 'deposit uses account class' do
      
      account = double("account")
      allow(account).to receive(:credit)
      customer = Customer.new

      expect(account).to receive(:credit).with(100)
      customer.deposit(100)
    end
  end

  # it 'deposit calls for a new transaction with the credit amount and balance' do
  #   transaction_class = double(:transaction_class, new: "got new")
  #   subject = described_class.new(transaction_class: transaction_class)
  
  #   expect(transaction_class).to receive(:new).with(credit: 10000, balance: 10000)
  #   subject.deposit(100)
  # end

  it 'should allow customer to deposit money' do
    customer = Customer.new

    account = double(:account, new: "new")
    new_account = described_class.new(account: account)
    
    expect(account).to receive(:new).with(current_balance: 0, transaction_history: [])
    customer.deposit(100)
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


