describe("Client", function() {
    var client; 
})

beforeEach(function() {
    client = new Client();
});

it('should have initial balance of 0', function() {
    expect(client.balance).toEqual(0);
});