# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

# class for customer
class Customer
  attr_reader :current_balance, :transaction_history

  def initialize
    @current_balance = 0
    @transaction_history = []
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance += amount
    payin = Transaction.new(balance: @current_balance, credit: amount, date: date)
    @transaction_history.unshift(payin)
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    @current_balance -= amount
    payout = Transaction.new(balance: @current_balance, debit: amount, date: date)
    @transaction_history.unshift(payout)
  end

  def statement
    printer = Printer.new
    each_trans = @transaction_history.map(&:display)
    printer.print_statement(each_trans)
  end
end
