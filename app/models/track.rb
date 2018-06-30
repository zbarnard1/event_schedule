class Track < ApplicationRecord
  has_many :events

  validates :name, :display_order, presence: true

end
