defmodule TwoSum do
	def run(numbers, target) do
		lookup(numbers, 0, target, %{})
	end

	defp lookup([], _, _, _), do: {}

	defp lookup([number | numbers], position, target, map) do
		complement = abs(number - target)
		if Map.has_key?(map, complement) do
			  {position, map[complement]}
			else
				lookup(numbers, 
							 position + 1,
							 target,
							 Map.put_new(map, number, position))
		end
	end

end


IO.inspect TwoSum.run [2, 7, 11, 15], 9