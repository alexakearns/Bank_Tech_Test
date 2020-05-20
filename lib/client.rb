# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

# class for client
class Client
  attr_reader :current_balance, :all_transactions

  def initialize
    @current_balance = 0
    @all_transactions = []
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance += amount
    payin = Transaction.new(balance: @current_balance, credit: amount, date: date)
    @all_transactions.unshift(payin)
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance -= amount
    payout = Transaction.new(balance: @current_balance, debit: amount, date: date)
    @all_transactions.unshift(payout)
  end

  def statement
    printer = Printer.new
    each_trans =  @all_transactions.map(&:display)
    printer.print_statement each_trans
  end

end
