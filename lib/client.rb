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
    @all_transactions << Transaction.new(100, 100, 0)
  end

  def withdraw(amount)
    @current_balance -= amount
    @all_transactions << -amount
  end
end
