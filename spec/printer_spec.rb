# frozen_string_literal: true

require 'printer'

describe Printer do
  it 'prints statement with headings' do
    printer = Printer.new
    array = ['Winner', 'Loser']
    result = "\nWinner\nLoser\n"
    expect { printer.print_statement(array) }.to output(printer.header + result).to_stdout
  end
end
