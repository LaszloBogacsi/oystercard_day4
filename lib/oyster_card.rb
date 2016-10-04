class OysterCard
attr_reader :balance, :in_journey

MAX_LIMIT = 90

  def initialize
      @balance = 0
      @in_journey = false
  end

  def top_up(amount)
    raise max_limit if limit_reached?(@balance + amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def max_limit
    "The maximum amount allowed on the card is £#{MAX_LIMIT}"
  end

  def limit_reached?(amount)
    (amount) > MAX_LIMIT
  end



end
