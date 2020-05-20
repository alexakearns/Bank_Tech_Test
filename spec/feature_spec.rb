# frozen_string_literal: true

require './lib/client'

describe 'Client Feature Test' do
  it 'client deposit 1000, 2000 and withdraw 500' do
    client = Client.new

    client.deposit(1000, '10/01/2012')
    client.deposit(2000, '13/01/2012')
    client.withdraw(500, '14/01/2012')

    expect { client.statement }.to output(" date || credit || debit || balance \n14\/01\/2012 \|\|  \|\| 500.00 \|\| 2500.00 \n13\/01\/2012 \|\| 2000.00 \|\|  \|\| 3000.00 \n10\/01\/2012 \|\| 1000.00 \|\|  \|\| 1000.00 \n").to_stdout
  end
end
