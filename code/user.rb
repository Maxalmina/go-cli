class Person
    def initialize(x, y)
        @location_x = x 
        @location_y = y
    end
end

class User < Person
    def initialize(coordinate)
        super(coordinate[0],coordinate[1])
        @name = "Go-cli User"
    end

    def get_user_info
        [@location_x, @location_y]
    end

    def update_user_location(coordinate)
        @location_x, @location_y = coordinate
    end
end