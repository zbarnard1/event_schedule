require 'rails_helper'

RSpec.describe Event do

  let(:valid_event_params) {{ 
    start_time: '12/8/2015 16:30',
    end_time: '12/8/2015 19:30',
    name: 'Event Name',
    track_id: 1
  }}


  context 'it validates its parameters' do
    valid_track_params = {
      id: 1,
      name: 'Track 1 - Pattern Recognition',
      display_order: 1
    }

    before(:all) { Track.create(valid_track_params) }
    after(:all) { Track.destroy_all }
    
    it 'can create a valid Event record' do
      expect(Event.new(valid_event_params).valid?).to eq true
    end

    it 'must have a start time' do
      expect(Event.new(valid_event_params.merge({start_time: nil})).valid?).to eq false
    end

    it 'must have an end time' do
      expect(Event.new(valid_event_params.merge({end_time: nil})).valid?).to eq false
    end

    it 'must have a name' do
      expect(Event.new(valid_event_params.merge({name: nil})).valid?).to eq false
    end

    it 'must have a track' do
      expect(Event.new(valid_event_params.merge({track_id: nil})).valid?).to eq false
    end

  end

end