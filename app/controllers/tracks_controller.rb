class TracksController < ApplicationController

  # GET /tracks
  # GET /tracks.json
  def index
    @offset = params[:offset].to_i || 0
    @selected_day = day(@offset)
    @tracks = Track.standard_tracks
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:start_time, :end_time, :name, :track_id, :offset)
    end

    def day(offset)
      o = offset || 0
      puts '********'
      puts "the day is: #{Event.order(start_time: :asc).first.start_time.advance(days: o)}"
      puts '********'
      Event.order(start_time: :asc).first.start_time.advance(days: o)
    end
end
