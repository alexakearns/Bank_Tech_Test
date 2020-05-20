# frozen_string_literal: true

require_relative 'transaction'

# class for client
class Client
  attr_reader :current_balance, :all_transactions

  def initialize
    @current_balance = 0
    @all_transactions = []
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance += amount
    deposit_transaction = Transaction.new(balance: @current_balance, credit: amount, date: date)
    @all_transactions.unshift(deposit_transaction)
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance -= amount
    withdraw_transaction = Transaction.new(balance: @current_balance, debit: amount, date: date)
    @all_transactions.unshift(withdraw_transaction)
  end

  def statement
    puts 'date || credit || debit || balance '
    @all_transactions.each do |object|
      puts object.display
    end
  end
end
