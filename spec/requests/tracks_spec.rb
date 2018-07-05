require 'rails_helper'

RSpec.describe "Tracks", type: :request do

    let(:valid_event_params) {{ 
      start_time: '12/8/2015 16:30',
      end_time: '12/8/2015 19:30',
      name: 'Event Name',
      track_id: 1
    }}

    let(:valid_track_params) {{
      id:1,
      name: 'Track 1 - Pattern Recognition',
      display_order: 1
    }}

  describe "GET /tracks" do
    it "works" do
      Track.create(valid_track_params)
      Event.create(valid_event_params)
      get tracks_path
      expect(response).to have_http_status(200)
    end
  end
end
