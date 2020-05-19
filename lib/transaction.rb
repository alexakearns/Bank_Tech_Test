# frozen_string_literal: true

# class for each client transction
class Transaction

  attr_reader :balance, :credit

  def initialize(balance, credit)
    @balance = balance
    @credit = credit
  end
end
