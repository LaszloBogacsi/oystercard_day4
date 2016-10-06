
class Journey
attr_reader :current_journey
attr_accessor :exit_station, :entry_station
MINIMUM_FARE = 1
PENALTY_FARE = 6

  def fare
    penalty? ? PENALTY_FARE : zone_calculation
  end

  def penalty?
    entry_station.nil? || exit_station.nil?
  end

  private

  def zone_calculation
    (entry_station.zone - exit_station.zone).abs + 1
  end
end
