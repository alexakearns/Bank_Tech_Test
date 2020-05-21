# frozen_string_literal: true

require './lib/client'

describe 'user can deposit and with draw funds and print statement ' do
  it 'client deposit 1000, 2000 and withdraw 500, statement prints transactions' do

    first_date = '10/01/2012'
    second_date = '13/01/2012'
    third_date = '14/01/2012'

    client = Client.new

    client.deposit(1000, first_date)
    client.deposit(2000, second_date)
    client.withdraw(500, third_date)

    statement_header = "date || credit || debit || balance \n"
    transaction_1 = /14\/01\/2012 \|\|  \|\| 500.00 \|\| 2500.00 /
    transaction_2 = /13\/01\/2012 \|\| 2000.00 \|\|  \|\| 3000.00 /
    transaction_3 = /10\/01\/2012 \|\| 1000.00 \|\|  \|\| 1000.00 /

    # expect { client.statement }.to output(" date || credit || debit || balance \n14\/01\/2012 \|\|  \|\| 500.00 \|\| 2500.00 \n13\/01\/2012 \|\| 2000.00 \|\|  \|\| 3000.00 \n10\/01\/2012 \|\| 1000.00 \|\|  \|\| 1000.00 \n").to_stdout
    expect { client.statement }.to output(/#{statement_header}/m).to_stdout
    expect { client.statement }.to output(transaction_1).to_stdout
    expect { client.statement }.to output(transaction_2).to_stdout
    expect { client.statement }.to output(transaction_3).to_stdout
  
  end
end
