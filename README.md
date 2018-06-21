# Go-cli
### Code of second stage final assignment COMPFEST X - SEA Academy

## Run The Script
---
This app can be executed in _three ways_ by run **main.rb** file:
1. Without parameter
    > $ ruby main.rb
2. With passing three space-separated integers as parameters. Assume the first Parameter value > second and third parameter values.
    > $ ruby main.rb  x y z
3. With passing filename with .in format. In this case, assume the file consists of 6 lines.
      * first line contains three space-separated integers denoting the respective values of size of map and user coordinate.
      * five other lines contains two space-separated integers describing driver coordinate.
    > $ ruby main.rb _filename_.in

    Sample file input content:

        12 1 4

        1 3

        6 7

        4 8

        5 6

        9 0

## App Description
----
When this app running, user will be prompted choices of action.
  1. Show Map
    
      Show the map with user and driver location.

  2. Order Go-Ride

      Information of the trip will appear and if user confirm, the data of transaction will be stored.

  3. View History

      List of user trip.

Additional information:

* User can be use the app many times whether the app still in use.

* Map will contains map description so user can be easily understand the map.

* Formula for the price is: unit of distance * C$200 (200 compfest dollar). Unit cost can be modified only by the admin. Unit of distance obtained from number of elements in the array of route.

## Data Storage
---
All completed trip information stored in save.txt, every three lines contains a completed trip information.
  * First line contains driver name
  * Second line contains route
  * Third line contains the price
  
Sample save.txt content:
  
    Try
  
    15 17,16 17,17 17,18 17,19 17,19 18,19 19
  
    C$2100
  
    Ary
  
    7 8,6 8,5 8,4 8,3 8,2 8,1 8,1 7,1 6,1 5,1 4,1 3,1 2,1 1,1 0
  
    C$4500



## Class Diagram of Go-cli
---
This application consists of five main classes, which is illustrated by the following diagrams.

![alt text][logo]

[logo]: https://github.com/Maxalmina/go-cli/blob/master/class_diagram_go-cli.jpg
