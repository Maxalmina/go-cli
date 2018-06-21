require_relative 'user'

class Driver < Person
    def initialize(name, coordinate)
        super(coordinate[0],coordinate[1])
        @driver_name = name
    end

    def get_driver_info
        [@driver_name, @location_x, @location_y]
    end
end