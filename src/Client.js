function Client() {
    this.current_balance = 0
}

Client.prototype.deposit = function(amount) {
    this.current_balance += amount
}

Client.prototype.withdraw = function(amount) {
    this.current_balance -= amount
}