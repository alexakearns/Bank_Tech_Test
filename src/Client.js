function Client() {
    this.balance = 0
}

Client.prototype.deposit = function(amount) {
    this.balance += amount
}
