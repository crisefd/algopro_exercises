defmodule PythagoreanTriplets do
	
	def find(numbers) do
		squares = numbers |> Enum.map(&(&1 * &1)) |> MapSet.new()
		for x <- numbers, y <- numbers do
			if MapSet.member?(squares, x * x + y * y) do
				{x , y , :math.sqrt(x * x + y * y) |> trunc}
			else
				nil
			end
		end
		|> Enum.find(false, &(&1 && true))
	end

end


IO.inspect PythagoreanTriplets.find [3, 5, 12, 5, 13]
IO.inspect PythagoreanTriplets.find [1, 1, 1, 1, 1, 1, 1, 1]
IO.inspect PythagoreanTriplets.find [1, 2, 3, 4]
IO.inspect PythagoreanTriplets.find [8, 2, 2, 3, 1]
