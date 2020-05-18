describe("Client", function() {
    var client; 
})

beforeEach(function() {
    client = new Client(100);
});

it('should return client balance', function() {
    expect(client.balance).toEqual(100);
});