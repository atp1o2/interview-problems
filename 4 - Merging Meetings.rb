# Interview Cake 4 
# Merging meeting times
# write a function that will return a condensed array of meetings times

meetings = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
# return =>   [ [0, 1], [3, 8], [9, 12] ]

# solution
# Note that meeting times are not in order 
# Need to check if the end of the meeting bleeds over to the next meeting time
# ie. IF arr[n][1] >= arr[n+1][0]
# if true, merge the arrays together 

# iterate through the array 
# at each iteration, check if arr[1] >= arr[n+1][0]

def condense_meeting_times(meetings)
    condensed = []
    meetings.sort!
    
    n = 0
    loop do
        break if meetings[n] == meetings.last

        if meetings[n].last >= meetings[n+1].first
            if meetings[n+1].last < meetings[n].last
               meetings.delete_at(n+1)
               next
            else
                meetings[n] << meetings.delete_at(n+1)
                meetings[n].flatten!
            end
        else
            n += 1
        end
    end
    meetings.each{ |arr| condensed << [arr[0], arr[-1]] }
    return condensed
end

# drive tests
meetings = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
meetings2 =  [ [1, 2], [2, 3] ] # [1,3]
meetings3 = [ [1, 5], [2, 3] ] # [1,5]
meetings4 = [ [1, 10], [2, 6], [3, 5], [7, 9] ] # [1,10]
condense_meeting_times(meetings4)
# O(n ln n) the sort accounts for the ln
# O(n) space


