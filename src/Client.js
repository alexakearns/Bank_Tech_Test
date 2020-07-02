function Client() {
    this.current_balance = 0
    this.all_transaction = []
}

Client.prototype.deposit = function(amount) {
    this.current_balance += amount
}

Client.prototype.withdraw = function(amount) {
    this.current_balance -= amount
}