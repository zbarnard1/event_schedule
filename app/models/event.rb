class Event < ApplicationRecord
  belongs_to :track

  validates :start_time, :end_time, :name, :track_id, presence: true
end
