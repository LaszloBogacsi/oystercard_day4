require 'journey'

class JourneyLog

attr_accessor :log, :current_journey

  def initialize
    @log = []
    @current_journey = Journey.new
  end

  def finish_journey
    #deduct(current_journey.fare)
    update_log(current_journey)
    reset_current_journey
  end

  def update_log(journey)
    @log << journey
  end

  def reset_current_journey
    @current_journey = Journey.new
  end


end
