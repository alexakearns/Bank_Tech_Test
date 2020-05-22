
class Account

  attr_reader :current_balance, :transaction_history
  INITIAL_BALANCE = 0
  def initialize
    @current_balance = INITIAL_BALANCE
    @transaction_history = []
  end

  def credit(amount)
    @current_balance += amount
    payin = Transaction.new(balance: @current_balance, credit: amount)
    @transaction_history.unshift(payin)
  end

  def debit(amount)
    @current_balance -= amount
  end
end
