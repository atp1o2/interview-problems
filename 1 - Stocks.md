# stocks
# find the max profit when buying and selling a stock
# you must buy before selling the stock 
# ex.
  stocks = [10, 7, 5, 8, 11, 9]
# get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)
#-------------------------------------------------

# brute force
# Nested loop through stocks, always iterating one forward
# find the biggest difference between stocks and store values
def get_max_profit(stocks)
    profit = 0
    transaction = Array.new(2)
    stocks.each_with_index do |buy, i|
        stocks[i+1..-1].each do |sell|
            potential_profit = sell - buy
            if potential_profit > profit
               profit = potential_profit 
               transaction[0] = buy
               transaction[1] = sell
            end
        end
    end
    p "Buy: #{transaction[0]}, Sell: #{transaction[1]} for Profit: #{profit}"
end
# O(n2) time: nested loop
# O(1) space


# Solve in O(n) time 
# set min_price to be the first element in the array
# find the first possible profit value
# iterate through array 
# find the max profit between current profit and the potentail_profit=(current-min)
# assign the new min_price
dec_stocks = [10, 7, 5, 3, 2, 1]
def get_max_profit_2(stocks)
   min_price = stocks[0]
   profit = stocks[1] - stocks[0]
   
   stocks.each_with_index do |current_price, i|   
       next if i==0
       potential_profit = current_price - min_price
       profit = [profit, potential_profit].max  
       min_price = [min_price, current_price].min
   end
   return profit
end

get_max_profit_2 stocks
# O(n) time
# O(1) space












