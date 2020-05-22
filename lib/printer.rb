# frozen_string_literal: true

require_relative 'customer'

# Printer class to print statement
class Printer
  attr_reader :header

  def initialize
    @header = 'date || credit || debit || balance '
  end

  def print_statement(transaction)
    puts @header
    puts transaction.join("\n")
  end
end
