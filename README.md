# go-cli
### An app of second stage final assignment SEA Academy [COMPFEST X](compfest.web.id)

This app can be executed in **three ways**:
  1. Without parameter
  2. With passing three space-separated integers as parameters. Assume the first Parameter value > second and third parameter values.
  3. With passing filename with .in format. In this case, assume the file consists of 6 lines.
    * first line contains three space-separated integers denoting the respective values of size of map and user coordinate.
    * five other lines contains two space-separated integers describing driver coordinate.

    Sample file content:

    12 1 4

    1 3

    6 7

    4 8

    5 6

    9 0
  
When this app running, user will be prompted choices of action.
  1. Show Map
  2. Order Go-Ride
  3. View History

All completed trip information stored in save.txt, every three lines contains a completed trip information.
  * First line contains driver name
  * Second line contains route
  * Third line contains the price

Map will contains map description so user can be easily understand the map.

Formula for the price is: unit of distance * 200 (unit cost). Unit cost can be modified only by the admin. Unit of distance obtained from number of elements in the array of route.

This application consists of five main classes, which is illustrated by the following diagrams.

![alt text][logo]

[logo]: https://github.com/Maxalmina/go-cli/blob/master/class_diagram_go-cli.jpg
