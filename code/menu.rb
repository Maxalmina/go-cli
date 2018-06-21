require_relative 'maps'
require_relative 'user'
require_relative 'drivers'
require_relative 'transactions'
require_relative 'init_app'
require 'enumerator'

class Menu
    def initialize;end

    def main_menu
        begin
            system "clear"
            puts "======== MENU ========"
            puts "| [1] Show Map       |"
            puts "| [2] Order Go Ride  |"
            puts "| [3] View History   |"
            puts "| [0] Exit           |"
            puts "======================"
            print "Choose Menu (Type '0'/'1'/'2'/'3'): "
            pilihan = STDIN.gets.chomp.to_i
        end until pilihan > -1 and pilihan < 4
        case pilihan.to_s
            when "1" then show_map
            when "2" then order_go_ride
            when "3" then view_history
            when "0" then system "clear"; puts "Thanks for using go-cli"
        end
    end

    def show_map
        begin
            system "clear"
            $maps_app.show_maps
            print "Type '0' to go back to menu : "
            back = STDIN.gets.chomp
            main_menu if back == "0"
        end until back == "0"
    end

    def order_go_ride
        begin
            system "clear"
            $maps_app.show_maps
            puts "Input your destination coordinate 0 - #{$maps_app.get_size-1}"
            print "(x y): "
            destination_coordinate = STDIN.gets.chomp.split(" ").map(&:to_i)
            verify = destination_coordinate.select{|value| value > -1 and value <$maps_app.get_size}
            puts "=========================================="
        end until verify.count == 2

        #init_maps_preview_for_order
        maps_view = Maps.new($maps_app.get_size)
        user_coordinate = $my_user.get_user_info
        maps_view.mark_location(user_coordinate,"S")

        #routes_preview
        user_routes = maps_view.route_to_destination($my_user, destination_coordinate)
        user_routes.each{|coordinate| maps_view.mark_location(coordinate,"O") if coordinate != user_coordinate}

        #search_nearest_driver
        driver_idx = maps_view.search_nearest_driver($my_user, $drivers)
        driver_name, *driver_location = $drivers[driver_idx].get_driver_info
        driver_location == user_coordinate ? maps_view.mark_location(user_coordinate,"Y") : maps_view.mark_location(driver_location,"N")

        #the_price_estimate
        price_estimate = "C$"+(user_routes.count * 200).to_s

        begin
            system "clear"
            puts "Trip Preview"
            maps_view.show_maps
            puts "Nearest driver    : #{driver_name}"
            puts "Price Estimate    : #{price_estimate}"
            puts "===================================================================="
            print "Type '1' to confirm go-ride order, type '0' to go back to menu : "
            confirm = STDIN.gets.chomp.to_i
        end until confirm > -1 and confirm < 2
        case confirm.to_s
            when "1"
                new_transaction = Transaction.new(driver_name, user_routes, price_estimate)
                new_transaction.save_transaction
                $my_user.update_user_location(destination_coordinate)
                begin
                    system "clear"
                    puts "Trip Completed"
                    print "Type '0' to go back to menu : "
                    back = STDIN.gets.chomp
                    main_menu if back == "0"
                end until back == "0"
            when "0" then main_menu
        end
    end

    def view_history
        begin
            system "clear"
            if File.exist?("save.txt")
                read_data_file
            else
                puts "History is empty"
            end
            print "Type '0' to go back to menu : "
            back = STDIN.gets.chomp
            main_menu if back == "0"
        end until back == "0"
    end

    def read_data_file
        data = IO.readlines("save.txt")
        read_data = []
        data.each_slice(3){|transaction| read_data << transaction.each{|data_trip| data_trip.rstrip!}}
        read_data.each_with_index{ |data_trip,index|
            puts "Trip #{index+1}"
            data_trip.each_with_index{|item,index|
                puts "Driver Name     : #{item}" if index == 0
                puts "Trip Route (x,y): #{item.gsub!(",",">>").gsub!(" ",",").gsub!(">>"," >> ")}" if index == 1
                puts "Trip Price      : #{item}" if index == 2
            }
            puts "=================================="
        }
    end
end