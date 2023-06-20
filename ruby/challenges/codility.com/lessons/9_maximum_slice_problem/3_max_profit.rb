# Find a maximum sum of a compact subsequence of array elements.

def solution1 list
  profit = 0

  min_price = list.first

  list.each do |item|
    min_price = [ item, min_price ].min

    profit = [ profit, item - min_price ].max
  end

  profit
end
