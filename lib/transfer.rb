class Transfer
  attr_reader :sender, :receiver, :amount, :sender_beginning_balance
  attr_accessor :status



  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @sender_beginning_balance = @sender.balance
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender_beginning_balance == @sender.balance
      if @sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

end
