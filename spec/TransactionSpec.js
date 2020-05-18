describe('Transaction', function() {
    var transaction; 
    var client;
});

beforeEach(function() {
    transaction = new Transaction();
    client = new Client();
;})

it('should change credit and new balance in transaction', function() {
    transaction.credit_account(50)
    expect(transaction.credit).toEqual(50)
    expect(transaction.balance).toEqual(50)
});