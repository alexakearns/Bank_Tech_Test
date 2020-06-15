# frozen_string_literal: true

class Transaction
  attr_reader :balance, :credit, :debit

  def initialize(balance: nil, credit: nil, debit: nil, date: Time.now.strftime('%d/%m/%Y'))
    @balance = balance
    @credit = credit
    @debit = debit
    @date = date
  end

  def display
    "#{@date} || #{float(@credit)} || #{float(@debit)} || #{float(@balance)} "
  end

  private

  def float(money)
    '%.2f' % money.to_f.truncate(2) unless money.nil?
  end
end
