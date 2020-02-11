
def sort(numbers, uniq)
    freqs =  numbers.inject({}) do |acc, n|
        acc[n] = acc[n].nil? ? 0 : acc[n] + 1
        acc
    end
    []
    .concat(Array.new(freqs[uniq[0]], uniq[0]))
    .concat(Array.new(freqs[uniq[1]], uniq[1]))
    .concat(Array.new(freqs[uniq[2]], uniq[2]))
end

p sort([2, 3, 3, 2, 3, 1, 1, 3, 3, 1, 2], [1, 2, 3])