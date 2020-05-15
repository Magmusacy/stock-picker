require 'pry'
=begin
make a stock_picker method that takes an array of stock prices, one for each day
use reduce to check which value is the biggest and which value is the lowest 
return an array with two best days to buy and sell stonks
first we check the THE FIRST LOWEST number and then we substract it from the following bigger numbers until there's lower number and we repeat this process with this new lowest number
=end
$stored = []
days = [17,3,6,9,15,8,6,1,10]

def stock_picker(stonks)
    stonks.reduce do |prev,curr|
        if prev < curr
            p "#{stonks.index(curr)} curr"
            p "#{stonks.index(prev)} prev"
            best = curr - prev
            $stored << [stonks.index(prev), stonks.index(curr), best] 
            # first element of this array is lowest value index
            # second element is biggest value index and the last is substracted value associated to these indexes
            p best
            curr = prev
        end
        curr
    end
end
stock_picker(days)
p $stored