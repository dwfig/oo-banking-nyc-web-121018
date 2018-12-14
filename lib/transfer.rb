require "pry"
require_relative "bank_account.rb"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def self.all
    @@all
  end

  def initialize(sender,receiver, amount)
    @amount = amount
    @receiver =  receiver
    @sender =  sender
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && self.status == "pending"
      ## should decrement sender.balance
      sender.balance -= amount
      ## should increment receiver.balance
      receiver.balance += amount
      @status = "complete"
      ## should create a new transaction/transfer
      ##    should store that transaction somewhere
      @@all << self
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end


  end

  def reverse_transfer
    ## should look in stored transactions
    transaction = @@all.last
    ## and "reverse" one
    ## by creating a new one? (( if this passes, that's great ))
    if transaction.status == "complete"
      transaction.sender.balance += transaction.amount
      transaction.receiver.balance -= transaction.amount
      transaction.status = "reversed"
    end
    ## or by incrementing sender.balance, decrementing receiver.balance?
    ## without creating a new transaction? will that matter?

  end


end # <<-- end of Transfer class
