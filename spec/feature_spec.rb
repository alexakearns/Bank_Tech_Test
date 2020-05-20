# frozen_string_literal: true

require 'client'

describe 'Feature Test for Client' do
  xit 'deposit 1000, deposit 2000, withdraw 500' do
    first_date = Time.new(2012, 1, 10)
    second_date = Time.new(2012, 1, 13)
    third_date = Time.new(2012, 1, 14)

    client = Client.new


    allow(Time).to receive(:now).and_return(first_date)
    client.deposit(1000)

    allow(Time).to receive(:now).and_return(second_date)
    client.deposit(2000)

    allow(Time).to receive(:now).and_return(third_date)
    client.withdraw(500)

    # header = date || credit || debit || balance \n
    # first_transaction =  10/01/2012 || 1000 || || 1000 
    # second_transaction = "13/01/2012 || 2000 || || 3000 \n"
    # third_transaction = "14/01/2012 ||  || 500 || 2500 \n"


    expect { client.statement }.to output(" date || credit || debit || balance ").to_stdout
    expect { client.statement }.to output(/ 10\/01\/2012 \|\| 1000 \|\| \|\| 1000 /).to_stdout
    expect { client.statement }.to output(/ 13\/01\/2012 \|\| 2000 \|\| \|\| 3000 /).to_stdout
    expect { client.statement }.to output(/ 14\/01\/2012 \|\|  \|\| 500 \|\| 2500 /).to_stdout
  end
end
