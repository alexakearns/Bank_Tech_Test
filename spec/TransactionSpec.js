describe('Transaction', function() {
    var transaction; 
    var client;
});

beforeEach(function() {
    transaction = new Transaction();
    client = new Client();
;})

it('should record credit and new balance in transaction', function() {
    client.deposit(100);
    expect(transaction.balance).toEqual(100);
    expect(transaction.credit).toEqual(100);
    expect(transaction.withdraw).toEqual(0);
});