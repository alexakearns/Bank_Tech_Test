describe('Transaction', function() {
    var transaction; 
    var client;
});

it('new instance should have balance of 0', function() {
    transaction = new Transaction();
    expect(transaction.balance).toEqual(0)
})

// beforeEach(function() {
//     transaction = new Transaction();
//     client = new Client();
//     client
// ;})

// it('should change credit and new balance in transaction', function() {
//     transaction.credit_account(50);
//     expect(transaction.credit).toEqual(50);
//     expect(transaction.debit).toEqual(0);
//     expect(transaction.balance).toEqual(50);
// });

// it('should change debit and balance using current balance', function() {
//     client.current_balance = 100
//     transaction.debit_account(client.current_balance, 25);
//     expect(transaction.credit).toEqual(0);
//     expect(transaction.debit).toEqual(25);
//     expect(transaction.balance).toEqual(75);
// });