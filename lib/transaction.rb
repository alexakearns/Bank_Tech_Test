# frozen_string_literal: true

# class for each client transction
class Transaction

  attr_reader :balance, :credit, :debit

  def initialize(balance: nil, credit: nil, debit: nil)
    @balance = balance
    @credit = credit
    @debit = debit
    @date = Time.now()
  end

  def display
    "#{date} || #{@balance} || #{@credit} || #{@debit}"
  end

  def date
    @date.strftime('%d/%m/%Y')
  end
end
