# You have an array of integers, and for each index 
# you want to find the product of every integer except the integer at that index
# ex
#   given [1, 7, 3, 4]
#   return   [84, 12, 28, 21]
#   by calculating   [7*3*4, 1*3*4, 1*7*4, 1*7*3]

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
# linearize the process
# start with 1
# arr[n] = arr[n] - arr[n-1] 
# repeat for the reverse arr
# mult both arrays together 

def get_products int_arr
    l_arr = Array.new(int_arr.size)
    r_arr = Array.new(int_arr.size)
    
    int_arr.each_with_index do |int, i|
        if i == 0
            l_arr[0] = 1
        else
            l_arr[i] = l_arr[i] * l_arr[i-1]
        end
    end
    
    l_arr
end

get_products int_arr
#Unifinished





















