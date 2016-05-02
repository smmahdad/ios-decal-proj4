# MyPromise
##Authors
- Sam Mahdad

## Purpose
I am creating this app to help people keep promises and committments to both 
themselves and to others. It will be a self- contained app where people can jot
 down what they want to do and promise themselves both in location and timing.
##Features
- Be able to view location based promises on a map
- Have push notifications occur when their promise should be occurring
- Allow to add and delete a promise

## Control Flow
- The user will be shown all their promises. The promises will be shown like a
 to-do list.
- The user will be allowed to click on their promise to show their streak,
 info about the promise, when it was created, and when it was completed.
- A button will be clickable for the map of promises and a button 
to create a new promise
- Map of promises will show markers of promises in geographic areas. This could
 be like to visit a museum in a city when they visit or to buy flowers for a
 loved one next time they are in the area.
- Creating a new promise would just be a form- like page where they fill in
 the necessary info for the new promise

## Implementation
### Model
- Promise.Swift
- GeoPromise.Swift
- DailyPromise.Swift
- OneTimePromise.Swift
- Statistics.Swift

### View
- MyPromiseOpenView. Not sure if this will be a view or if I can do something
 besides a view to show the opening screen.
- CurrentPromisesController.Swift
- AddPromiseViewController.Swift
- MapPromisesViewController.Swift
- PromiseDetailsViewController.Swift

### Controller (Made them the same)
- CurrentPromisesController.Swift
- AddPromiseViewController.Swift
- MapPromisesViewController.Swift
- PromiseDetailsViewController.Swift

### Notes
- This should only be ran on the iPhone 6s Plus in portrait mode
- GeoCoding (Apple's default coordinate finder) has issues
 so you can't ping make a geographical promise and quickly swap
 to the map for fear of crashing.
- Also, the geocoding throws a nil if it can't find the location
 and I couldn't figure out how to catch that.
