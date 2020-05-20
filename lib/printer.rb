require_relative 'client'

class Printer

  def initialize
    puts ' date || credit || debit || balance '
  end

  def print_statement(transaction)
    puts transaction.join("\n")
  end
end
