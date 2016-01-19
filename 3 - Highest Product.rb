# Interview Cake 3 
# Given an array_of_ints, find the highest_product you can get from three of the integers

# Collect the largest value from the array 
# Collect the next two highest positive values
# Collect the two highest negative values
# use the pos or neg set with the largest product
# mult this product with the highest value from the array
ints = [4,5,3,6]
ints2 = [5,10,-6,-7,7]
ints3 = [-10, -10, 1, 3, 2]

def highest_product_of_three(array_of_ints)
   max_value = array_of_ints.delete(array_of_ints.max)
   pos_values = array_of_ints.max(2).inject(&:*)
   neg_values = array_of_ints.min(2).inject(&:*)
   
    if pos_values > neg_values
      return pos_values * max_value
    else
      return neg_values * max_value
   end
end


# Stretch
# Product of n items?
# need to account for either odd or even n size 

# Evens
# sort ints array 
# keep mult in sets of two and drop into array
# take n/2 highest values and mult together for ANS

# Odds
# compare highest pos value with highest absolute neg value
# Set the higher to the max value and delete it from array
# sort ints array 
# keep mult in sets of two and drop into array
# take (n-1)/2 highest values and mult with max for ANS

def highest_products(ints, n)

end


highest_products ints3, 4



