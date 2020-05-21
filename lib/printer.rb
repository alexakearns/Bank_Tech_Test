# frozen_string_literal: true

require_relative 'customer'

# Printer class to print statement
class Printer
  def initialize
    puts ' date || credit || debit || balance '
  end

  def print_statement(transaction)
    puts transaction.join("\n")
  end
end
