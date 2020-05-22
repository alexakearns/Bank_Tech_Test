
class Account

  attr_reader :current_balance
  INITIAL_BALANCE = 0
  def initialize
    @current_balance = INITIAL_BALANCE
  end

  def credit(amount)
    @current_balance += amount
  end

  def debit(amount)
    @current_balance -= amount
  end
end
