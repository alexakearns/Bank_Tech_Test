describe("Client", function() {
    var client; 
})

beforeEach(function() {
    client = new Client();
});

it('should return client balance', function() {
    expect(client.balance).toEqual(0);
});