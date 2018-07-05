class Track < ApplicationRecord
  has_many :events

  validates :name, :display_order, presence: true

  def all_events(selected_day)
    events
    .where("start_time >= ? and start_time <= ?", selected_day.beginning_of_day, selected_day.end_of_day )
    .all + alltrack_events_on_day(selected_day)
  end

  def self.standard_tracks
    Track.where.not(name: "All").order(display_order: :asc)
  end

private

  def alltrack_events_on_day(selected_day)
    Event
    .where("track_id == ? and start_time >= ? and start_time <= ?", all_track_id, selected_day.beginning_of_day, selected_day.end_of_day )
    .all
  end

  def all_track_id
    Track.where(name: "All").ids
  end
end
