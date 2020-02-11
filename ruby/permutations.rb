

def pemute(list)
    result = []
    if list.empty?
        result << []
    else
        list.each do |item|
            permute(list - [item]).each do |rest|
               result << rest.unshift(item)
            end
        end
    end
    result
end


p pemute([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 2, 1], [3, 1, 2]]

=begin
 Time complexity is O(!n) where n: length of list
 Space complexity is O(!n) where n: length of list
=end