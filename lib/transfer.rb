class Transfer
  attr_reader :sender

  def initialize(sender, recipient, amount)
    @sender = sender
  end

end
