This is a rails application to display a schedule of events.  It reads a csv file and should display a schedule of events organized by track.  the Master branch is incomplete, since there was a 4 hour time limit on this exercise, but I continued to work on the project on the 'completing_code_test' branch.

My plan for the view was to use a Bootstrap grid to organize the chart into 6 columns, one for the Y axis labels in 5 minute increments and one for each of the 5 tracks.  The Y axis would use a constant "Time Unit Scalar" measured in px (more on that in a moment).  Each track column would be populated with the events that are on that track, and events that are on the special "All" track would appear on all tracks.  I would then use CSS to make the height of each div in a particular column proportional to its duration by multiplying its duration by the constant Time Unit Scalar.
The data model is set up to be able to specify the display order of the tracks.

To install:
Clone this repo and run rails db:migrate, then rails db:seed to perform migrations, read the csv file, and seed the database.
Note: There are 5 standard tracks plus the additional "All" track and 24 Events, so you should have 6 records in the Tracks table and 24 records in the Events table when rake db:seed is finished.