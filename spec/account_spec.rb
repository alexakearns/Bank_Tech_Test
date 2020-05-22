# frozen_string_literal: true

require 'account'

describe Account do
  it 'change balance when account receives credit' do
    account = Account.new
    account.credit(50)
    expect(account.current_balance).to eq 50
  end
end