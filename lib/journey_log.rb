class JourneyLog

attr_accessor :log, :current_journey

  def initialize
    @log = []
    @current_journey = Journey.new
  end

  def finish_journey
    update_log(current_journey)
    reset_current_journey
  end

  def update_log(journey)
    @log << journey
  end

  def update_entry(station)
    current_journey.entry_station = station
  end

  def update_exit(station)
    current_journey.exit_station = station
  end

  def  double_entry?
    current_journey.entry_station != nil
  end

  def fare
    current_journey.fare
  end

  private
  def reset_current_journey
    @current_journey = Journey.new
  end
end
