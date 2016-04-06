# MyPromise
##Authors
- Sam Mahdad

## Purpose
I am creating this app to help people keep promises and committments to both 
themselves and to others. It will be a self- contained app where people can jot
 down what they want to do and promise themselves both in location and timing.
##Features
- Be able to view location based promises on a map
- Have push notifications occur when it is in the time block of a promise
- Allow to add and edit a promise

## Control Flow
- User will be shown a splash screen showing the logo
- Then the user will be shown all their promises. Debating about showing it in
 a calendar manner for the day, week, month, or locations or what.
- The user will be allowed to click a button to show their promise streaks, map
 of promises, list of daily promises, or to create a new promise
- Promise streaks will show a list of all the daily/recurring promises and out
 of the max number of days they could have completed their promise, they did
- Map of promises will show markers of promises in geographic areas. This could
 be like to visit a museum in a city when they visit or to buy flowers for a
 loved one next time they are in the area.
- List of daily promises will just show a list of the promises they created
- Creating a new promise would just be a form- like page where they fill in
 the necessary info for the new promise

## Implementation
### Model
- Promise.Swift

### View
- MyPromiseOpenView. Not sure if this will be a view or if I can do something
 besides a view to show the opening screen.
- PromiseListTableView
- AddPromiseView
- PromiseMapView
- PromiseStreakView

### Controller
- AddPromiseViewController
- PromiseListTableViewController
- PromiseMapViewController
- MyPromiseOpenViewController
- PromiseStreakViewController
