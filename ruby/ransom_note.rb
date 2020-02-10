
def can_construct?(mangazine, note)
    frequencies = {}
    mangazine.each_char do |chr|
        if frequencies[chr].nil? 
            frequencies[chr] = 1 
        else 
            frequencies[chr] += 1
        end
    end
    note.each_char do |chr|
        if frequencies[chr].nil? || frequencies[chr].zero?
            return false
        end
        frequencies[chr] -= 1
    end
    return true
end

p can_construct?("aabbb", "aba") # => true
p can_construct?("aabb", "abaa") # => false
p can_construct?("murcielago", "aeiou") #=> true

=begin
Time complexity is  O(n + m) where n: length of magazine, m: length of note

Space complexity is  O(h) where h: number of entries in frequencies dictionary
=end