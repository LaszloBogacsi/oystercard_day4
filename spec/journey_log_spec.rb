require 'journey_log'
require 'journey'

describe JourneyLog do
subject(:journey_log) {described_class.new}
subject(:current_journey) {Journey.new}

let (:station) {double('station', name: "King's Cross", zone: 1)}
let (:station2) {double('station2', name: "Holborn", zone: 1)}

let(:journey) {double('journey', entry_station: station, exit_station: station2)}

  it 'initialize with an empty journey log array' do
    expect(journey_log.log).to eq []
  end

  it 'initialize with a new journey' do
    expect(journey_log.current_journey).to be_an_instance_of Journey
  end

  it 'has to be able to record journeys' do
    journey_log.log << journey
    expect(journey_log.log.last).to be journey
  end

  context '#finish_journey' do
    it 'current journey should be recorded in log' do
      journey_log.current_journey = journey
      journey_log.finish_journey
      expect(journey_log.log.last).to eq journey
    end

    it 'current journey resets to a blank journey' do
      journey_log.current_journey = journey
      journey_log.finish_journey
      expect(journey_log.current_journey).to have_attributes(entry_station: nil, exit_station: nil)
    end
  end

  context "#fare" do
    it "fare method should reflect penality fare for incomplete journey" do
      expect(journey_log.fare).to eq Journey::PENALTY_FARE
    end
  end
end
