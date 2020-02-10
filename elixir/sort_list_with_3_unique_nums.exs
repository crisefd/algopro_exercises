defmodule SortListWith3UniqueNums do

	def sort(numbers) do
		counts = count_numbers(%{}, numbers)
		List.duplicate(1, counts[1])
		++ List.duplicate(2, counts[2])
		++ List.duplicate(3, counts[3])
	end

	defp count_numbers(counts, []), do: counts

	defp count_numbers(counts, [number | numbers]) do
		counts
		|> Map.update(number, 1, &(&1 + 1))	
		|> count_numbers(numbers)
	end
	
end

IO.inspect SortListWith3UniqueNums.sort([2, 3, 3, 2, 3, 1, 1])