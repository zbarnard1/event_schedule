This is a rails application to display a schedule of events.  It reads a csv file and will display a schedule of events organized by track.  You can change which day's events are displayed by using the arrows in the upper left.

In the interest of time, I chose not to write an exhaustive test suite like I would with a real application.  However, I did employ TDD as much as was practical, with extra attention on the data model so I could be sure that my data was good after seeding the database.

To install:
Clone this repo and run rails db:migrate, then rails db:seed to perform migrations, read the csv file, and seed the database.

Note: There are 6 Tracks (including the "All" track, which is not displayed on its own) and 24 Events, so you should have 6 records in the Tracks table and 24 records in the Events table when rake db:seed is finished.