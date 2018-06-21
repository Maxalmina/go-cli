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
      * first line contains three space-separated integers denoting values of size of map and user coordinate.
      * next five lines contains two space-separated integers describing driver coordinate.
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
    
      Show the map with user marked with "S" and drivers location marked with "X". Map contains map description so user can be easily understand the map. In case of generate random driver location when run the app, user and driver can be in the same location and will be marked with "Y".

  2. Order Go-Ride

      Information of the trip complete with route preview will appear and if user confirm, user location will be updated and data of the trip will be stored in save.txt. The route will be marked with "O" in map preview, user location mark will not changed, so start point/user location will not marked with "O". Nearest driver will be marked with "N" and another driver will be disappear from map preview.

  3. View History

      List of user completed trip information which contains driver name, route, and the price. However, the route is only described as a coordinate sequence or array of coordinate from starting point to destination point. Top of the list are the latest completed trip of user.
 
Additional information:

* User can be use the app many times even if the app still in use.

* When searching nearest driver from user location, this app use euclidean formula.

* Formula for the price is: unit of distance * C$200 (200 compfest dollar). Unit cost can be modified only by the admin. Unit of distance obtained from number of elements in the array of route.

## Data Storage
---
All completed trip information stored in **save.txt**, every three lines contains a completed trip information.
  * First line contains driver name
  * Second line contains array of route coordinate (x,y)
  * Third line contains the price
  
Sample save.txt content:
  
    Try
    15 17,16 17,17 17,18 17,19 17,19 18,19 19
    C$2100
    Ary
    7 8,6 8,5 8,4 8,3 8,2 8,1 8,1 7,1 6,1 5,1 4,1 3,1 2,1 1,1 0
    C$4500

## Class Diagram of the App
---
This application consists of five main classes, which is illustrated by the following diagrams.

![alt text][logo]

[logo]: https://github.com/Maxalmina/go-cli/blob/master/class_diagram_go-cli.jpg