# frozen_string_literal: true
require_relative 'transaction'

# class for client
class Client
  attr_reader :current_balance, :all_transactions

  def initialize
    @current_balance = 0
    @all_transactions = []
  end

  def deposit(amount)
    @current_balance += amount
    deposit_transaction(balance: @current_balance, credit: amount)
  end

  def withdraw(amount)
    @current_balance -= amount
    withdraw_transaction(balance: @current_balance, debit: amount)
  end

  def statement
    puts'balance || credit || debit'
    @all_transactions.each do |object|
      puts object.display
    
    end
  end

  private

  def deposit_transaction(balance: nil, credit: nil)
    deposit = Transaction.new(balance: balance, credit: credit)
    @all_transactions << deposit
  end

  def withdraw_transaction(balance: nil, debit: nil)
    withdraw = Transaction.new(balance: balance, debit: debit)
    @all_transactions << withdraw
  end
end
