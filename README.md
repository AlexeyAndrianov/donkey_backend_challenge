# Donkey Challenge

Welcome to Donkey Challenge :D

We have a very simple app that consists of 2 models:

* Bike
* Location

and 1 endpoint that allows to post the newest location of the bike.

# The Task

Let's assume that every bike has a gps tracker that posts its current location aoproximately every 30 minutes

The task at hand is to create an endpoint where we can get a bike with its current location
(simple `GET bikes/:id` endpoint).

The problem with the location we get from the tracker is that it is not very precise and even when the bike is standing still
we can get consecutive location readings that are 50 meters apart.  We don't want users to walk in circles to find a bike therefore
we need some way of approximating the location based on the readings we get. The location returned in `GET bikes/:id` endpoint should
be the approximate one.

When building the solution let's assume that the code should work on a data set that has been gathering information
for quite some time (there may be thousands of bikess and bikes may have already a lot of historical locations)
and that we expect non-trivial traffic on the `bikes/:id` enddpoint (for sure heavier than what we get on POST location endpoint)

The data store is sqlite for simplicity. If you need to add any other datastore feel free to do so. Same regarding any additional
libraries. You are of course welcome to change the existing code.

Please create a Pull Request with your solution.
