# frozen_string_literal: true

require 'printer'

describe Printer do
  it 'prints statement with headings' do
    array = ['Winner', 'Loser']
    header = " date || credit || debit || balance \n"
    result = "Winner\nLoser\n"
    expect { subject.print_statement(array) }.to output(header + result).to_stdout
  end
end
