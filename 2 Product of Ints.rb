# You have an array of integers, and for each index 
# you want to find the product of every integer except the integer at that index
# ex
#   given [1, 7, 3, 4]
#   return   [84, 12, 28, 21]
#   by calculating   [7*3*4, 1*3*4, 1*7*4, 1*7*3]
#
# Account for zeros? Repeated numbers?

# brute force
# loop with index
# multiply every other index value except for the value at the current index 
# drop that product into an arr and return it 

int_arr = [1, 7, 3, 4]

def get_products_of_all_ints_except_at_index(int_arr)
   result = Array.new(int_arr.size)
   int_arr.each_with_index do |int, i|
        result[i] = int_arr.reject{|int_to_exclude| int_to_exclude == int }.inject(&:*)
   end
   return result
end
get_products_of_all_ints_except_at_index int_arr
# O(n)loop * O(n)reject = O(n2) time
# O(n) space for array size


# optimize solution
# store the mult. products to be used later
# the first set of products should be arr[n]*arr[n-1]
# the second should should be the inverse of this pattern
# multiplying the sets together returns the correct product excluding 
# the current index

# the product of all the integers before each index: l_arr
# the product of all the integers after each index: r_arr
int_arr = [1, 7, 3, 4]
def get_products ints
    l_arr = Array.new
    r_arr = Array.new
    
    prev_product = 1
    
    start = 0
    while start <= ints.size - 1
        l_arr[start] = prev_product
        prev_product *= ints[start]
        start += 1
    end

    prev_product = 1
    last = ints.length - 1 
    while last >= 0
        r_arr[last] = prev_product 
        prev_product *= ints[last]
        last -= 1
    end
    
    results = Array.new(ints.size)
    i = 0
    while i <= l_arr.size - 1 
        results[i] = l_arr[i] * r_arr[i]
        i+=1
    end
    results
end

get_products int_arr






