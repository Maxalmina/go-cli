require_relative 'maps'
require_relative 'user'
require_relative 'drivers'

class Transaction
    def initialize(driver, routes, price)
        @driver = driver
        @routes = routes
        @price = price
    end

    def save_transaction
        aFile = File.new("save.txt", "a+")
        if aFile
            #File.zero?("save.txt") ? aFile.syswrite("1\n") : replace_file_transaction
            aFile.syswrite(@driver+"\n")
            user_routes = @routes.map {|x| x.join(" ")}.join(",")
            aFile.syswrite(user_routes+"\n")
            aFile.syswrite(@price+"\n")
        else
            puts "Unable to save"
        end
    end
end