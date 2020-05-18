describe("Client", function() {
    var client; 
})

beforeEach(function() {
    client = new Client();
});

it('should have initial balance of 0', function() {
    expect(client.balance).toEqual(0);
});

it('should increase balance when depositing funds', function() {
    client.deposit(25);
    expect(client.balance).toEqual(25);
});

it('should decrease balance when withdrawing funds', function() {
    client.deposit(25)
    client.withdraw(5)
    expect(client.balance).toEqual(5)
})
