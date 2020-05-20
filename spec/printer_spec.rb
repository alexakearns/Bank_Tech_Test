require 'printer'

describe Printer do

  it 'prints statement with headings' do
    array = ['Winner', 'Loser']
    result =  "Winner\nLoser\n"
    expect { subject.print_statement(array) }.to output(" date || credit || debit || balance \n" + result).to_stdout
  end

end
