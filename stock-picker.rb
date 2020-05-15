require 'pry'
=begin
make a stock_picker method that takes an array of stock prices, one for each day
use reduce to check which value is the biggest and which value is the lowest 
return an array with two best days to buy and sell stonks
first we check the THE FIRST LOWEST number and then we substract it from the following bigger numbers until there's lower number and we repeat this process with this new lowest number
=end
$stored = []
days = [17,3,6,9,15,8,6,1,10]

def get_indexes(stored_hash) 
    stored_hash.map {|hash| hash.values}.reduce {|prev,curr| curr.last < prev.last ? prev : curr}.first(2)
end

def stock_picker(stonks)

    stonks.reduce do |prev,curr|

        if prev < curr

            difference = curr - prev
            $stored << {
                low_index: stonks.index(prev),
                big_index: stonks.index(curr),
                difference: difference
            }
            curr = prev

        end
        curr

    end
    get_indexes($stored)
    
end

p stock_picker(days)
