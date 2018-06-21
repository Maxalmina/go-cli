require_relative 'maps'
require_relative 'user'
require_relative 'drivers'
require 'io/console'

class InitApp
    def initialize;end

    def open_app
        driver_location = []
        if ARGV.empty?
            size = 20
            user_location = $init_app.my_random(size)
            5.times {driver_location << $init_app.my_random(size)}
        else
            if ARGV.join("").include? ".in"
                filename_input = ARGV.join("")
                inputan = IO.readlines(filename_input)
                size, *user_location = inputan[0].split(" ").map(&:to_i)
                for i in (1..5)
                    driver_location << inputan[i].split(" ").map(&:to_i)
                end
            elsif ARGV.length == 3
                size, *user_location = ARGV.map(&:to_i)
                5.times {driver_location << $init_app.my_random(size)}
            end
        end
        $init_app.init_maps(size)
        $init_app.init_user(user_location)
        $init_app.init_driver(driver_location)
    end

    def init_maps(size)
        $maps_app = Maps.new(size)
    end

    def init_user(user_location)
        $my_user = User.new(user_location)
        $maps_app.mark_location(user_location,"S")
    end

    def init_driver(driver_location)
        driver_name = ["Ary", "Mike", "Try", "Sam", "Boi"]
        $drivers = []
        for i in (0..4) do
            $drivers << Driver.new(driver_name[i],driver_location[i])
            $my_user.get_user_info != driver_location[i] ? $maps_app.mark_location(driver_location[i],"X") : $maps_app.mark_location(driver_location[i],"Y")
        end
    end

    def my_random(size)
        2.times.map{rand(size)}
    end
end