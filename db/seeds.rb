require 'csv'
require 'set'
require_relative '../app/models/event.rb'
require_relative '../app/models/track.rb'


def create_tracks
  csv_text = File.read('test_events.csv')
  csv_for_tracks = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  # Creates standard Tracks
  set = Set.new
    
  csv_for_tracks.each { |row| set << row['track'] }

  set.each do |set_item|
    if set_item.match(/^track \d/i)
      t = Track.new
      t.name = set_item
      t.display_order = set_item.split(' ')[1]
      t.save
      puts "saved #{t.name}"
    end
  end

  # Creates "all" track
  t = Track.new( { name: "All", display_order: Track.count + 1 } )
  t.save
  puts "saved #{t.name}"
  puts "There are now #{Track.count} rows in the Track table"
end

def create_events
  csv_text = File.read('test_events.csv')
  csv_for_events = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  csv_for_events.each do |row|
    e = Event.new
    e.start_time = row['start']
    e.end_time = row['finish']
    e.name = row['name']
    if row['track'].match(/^track \d/i)
      e.track = Track.find_by name: row['track']
    else
      e.track = Track.find_by name: "All"
    end
    e.save
    puts "saved #{e.name}"
  end
  puts "There are now #{Event.count} rows in the Events table"
end

create_tracks
create_events
