defmodule Permutations do
	def run(list) do
		list 
		|> Enum.with_index()
		|> Map.new(fn {item, index} -> {index, item}  end)
		|> permute(0, length(list) - 1)
		|> List.foldl( [], &( &1 ++ &2))
	end

	defp permute(map_list, start, fin ) when start == fin, do: Map.values(map_list)

	defp permute(map_list, start, fin) do
		for position <- start..fin do
			%{ map_list | start => map_list[position], position => map_list[start] }
			|> permute(start + 1, fin)
		end
	end
end

IO.inspect Permutations.run [1, 2, 3, 4]