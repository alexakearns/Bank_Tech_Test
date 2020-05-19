# frozen_string_literal: true

# class for each client transction
class Transaction

  attr_reader :balance, :credit, :debit

  def initialize(balance, credit, debit)
    @balance = balance
    @credit = credit
    @debit = debit
  end
end
