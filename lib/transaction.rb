# frozen_string_literal: true

# class for each client transction
class Transaction

  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end
end
