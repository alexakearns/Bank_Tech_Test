function Transaction() {
    this.balance = 0
    this.credit = 0
    this.debit = 0
}

Transaction.prototype.credit_account = function(amount) {
    this.balance += amount
    this.credit = amount
}