require_relative "station"
require_relative "journey"
require_relative "journey_log"

class OysterCard
  attr_reader :balance, :in_journey, :current_journey, :journey_log

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1


  def initialize
      @balance = 0
      @journey_log = JourneyLog.new

  end

  def top_up(amount)
    raise max_limit if limit_reached?(balance + amount)
    @balance += amount
  end

  def touch_in(station)
    balance_update if journey_log.double_entry?
    raise "You don't have enough money" if insufficient_funds?
    journey_log.update_entry(station)
  end

  def touch_out(station)
    raise "You don't have enough money" if insufficient_funds?
    journey_log.update_exit(station)
    balance_update
  end

  private

  def balance_update
    deduct(journey_log.fare)
    journey_log.finish_journey
  end

  def deduct(amount)
    @balance -= amount
  end

  def max_limit
    "The maximum amount allowed on the card is £#{MAX_LIMIT}"
  end

  def limit_reached?(amount)
    (amount) > MAX_LIMIT
  end

  def insufficient_funds?
    balance < MINIMUM_BALANCE
  end
end
