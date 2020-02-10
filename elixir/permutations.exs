defmodule Permutations do
	
	def permute([]), do: [[]]
	def permute(list) do
		for item  <- list, rest <- permute(list -- [item]) do 
			[item | rest] 
		end
	end

end


IO.inspect Permutations.permute [1, 2, 3]
IO.inspect Permutations.permute [1, 2, 3, 4]
IO.inspect Permutations.permute ["A", "B", "C", "D"]




