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
we can get consecutive location readings that are 50 meters apart. We don't want users to walk in circles to find a bike therefore
we need some way of approximating the location based on the readings we get. For simplicity we can assume that the approximation can
be just a simple average of latitude and longitude of up to 5 last readings from given location.  The location returned in `GET bikes/:id` endpoint should
be the approximate one.

When building the solution let's assume that the code should work on a data set that has been gathering information
for quite some time (there may be thousands of bikess and bikes may have already a lot of historical locations)
and that we expect non-trivial traffic on the `bikes/:id` enddpoint (for sure heavier than what we get on POST location endpoint)

The data store is sqlite for simplicity. If you need to add any other datastore feel free to do so. Same regarding any additional
libraries. You are of course welcome to change the existing code.

# How to submit solution
1. First clone the repo
2. Create a personal private repository on github
3. Add `jensfrandsen` and `piotrj` as collaborators to your repository
4. Add your repository as second remote to the project
5. Push master branch to your remote
6. Create a branch were you work on the solution
7. Push a branch with the solution to your repo and create a Pull Request
8. Then during a call we can talk about the Pull Request

