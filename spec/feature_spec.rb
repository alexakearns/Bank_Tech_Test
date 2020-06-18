# frozen_string_literal: true

require './lib/customer'

describe 'user can deposit and with draw funds and print statement ' do
  it 'client deposit 1000, 2000 and withdraw 500, prints statement' do
    first_date = Time.new(2012, 1, 10)
    second_date = Time.new(2012, 1, 13)
    third_date = Time.new(2012, 1, 14)

    customer = Customer.new

    allow(Time).to receive(:now).and_return(first_date)
    customer.deposit(1000)

    allow(Time).to receive(:now).and_return(second_date)
    customer.deposit(2000)

    allow(Time).to receive(:now).and_return(third_date)
    customer.withdraw(500)

    statement_header = "date || credit || debit || balance \n"
    transaction1 = %r{14\/01\/2012 \|\|  \|\| 500.00 \|\| 2500.00 }
    transaction2 = %r{13\/01\/2012 \|\| 2000.00 \|\|  \|\| 3000.00 }
    transaction3 = %r{10\/01\/2012 \|\| 1000.00 \|\|  \|\| 1000.00 }

    expect { customer.statement }.to output(/#{statement_header}/m).to_stdout
    expect { customer.statement }.to output(transaction1).to_stdout
    expect { customer.statement }.to output(transaction2).to_stdout
    expect { customer.statement }.to output(transaction3).to_stdout
  end
end
