# Donkey Challenge

Welcome to Donkey Challenge :D

We have a very simple app that consists of 2 models:

* Bike
* Location

and 1 endpoint that allows to post the newest location of the bike.

# The Task

Let's assume that every bike has a gps tracker that posts its current location aoproximately every 5 minutes

The task at hand is creating an endpoint where we can get a bike with its current location
(simple `bikes/:id` endpoint).

The problem we have with gps trackers is that they are not very precise when working in cities
with tall buildings. Therefore even when the bike is standing still we can get consecutive location
readings that are 50 meters apart. We don't want users to walk 50 meters to a place and not find a bike
so we want to somehow approximate the location in those cases.

When building the solution let's assume that the code should work on a data set that has been gathering information
for quite some time (there may be tens of thousands of bikess and bikes may have already a lot of historical locations)
and we expect non-trivial traffic on the `bikes/:id` enddpoint

The data store is sqlite for simplicity. If you need to add any other datastore feel free to do so. Same regarding any additional
libraries.

Please create a Pull Request with your solution.
