
def get_range(list, target)
    first = binary_search(list, list.length - 1, 0, target, true)
    last  = binary_search(list, list.length - 1, 0, target, false)
    [first, last]
end

def binary_search(list, upper, lower, target, finding_first)
    loop do
       return -1 if upper < lower
       middle = lower + ((upper - lower) / 2)
       if finding_first
           if (middle == 0 || target > list[middle - 1]) && list[middle] == target
                return middle
            elsif target > list[middle]
                lower = middle + 1
            else
                upper = middle - 1
           end
        else
            if (middle == list.length - 1 || target < list[middle + 1]) && list[middle] == target
                return middle
            elsif target < list[middle]
                upper = middle - 1
            else
                lower = middle + 1
            end
       end
    end
end


p get_range([1, 3, 3, 5, 7, 8, 9, 9, 9, 15], 9) # => [6, 8]
p get_range([-5, -2, 0, 0, 7, 9, 20, 50], 0) # => [2, 3]
p get_range([-5, -5, -5,  -2, -1, 0, 7, 9, 20, 50], -5) # => [0, 2]

=begin

Time complexity is O(nlog(n)). Where n is length of list
Space complexity is constant.

=end