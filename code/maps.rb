require_relative 'user'
require_relative 'drivers'

class Maps
    attr_reader :size_of_map
    def initialize(size_of_map)
        @size_of_map = size_of_map
        @maps = Array.new(size_of_map, "-"){Array.new(size_of_map, "-")}
    end
    
    def show_maps
        @maps.each {|row| puts row.join(" ")}
        puts "==================================="
        puts "S: User"
        puts "X: Driver"
        puts "N: Nearest Driver"
        puts "Y: User & Driver at same location"
        puts "O: Routes to Destination"
        puts "==================================="
    end

    def get_size
        @size_of_map
    end

    def mark_location(coordinate, mark)
        @maps[coordinate[0]][coordinate[1]] = mark
    end

    def search_nearest_driver(user, list_of_driver)
        user_location = user.get_user_info
        list_of_driver_location = []
        list_of_driver.each{ |driver| 
            name, *driver_coordinate = driver.get_driver_info;
            list_of_driver_location << driver_coordinate
        }
        list_of_driver_location.map! {|driver_location| driver_location.zip(user_location).map {|i, j| (i-j)**2}.sum}
        list_of_driver_location.map! {|item| item**0.5}
        list_of_driver_location.rindex(list_of_driver_location.min)
    end

    def route_to_destination(user, destination_coordinate)
        user_location = user.get_user_info
        routes = [user_location]
        dif_x, dif_y = destination_coordinate.zip(user_location).map{|i,j| i-j}
        x, y = user_location
        while (dif_x != 0)
            if dif_x > 0
                x += 1
                dif_x -= 1
            else
                x -= 1
                dif_x += 1
            end
            routes << [x,y]       
        end
        while dif_y !=0
            if dif_y > 0
                y += 1
                dif_y -= 1
            else
                y -= 1
                dif_y += 1
            end
            routes << [x,y]
        end
        routes
    end
end