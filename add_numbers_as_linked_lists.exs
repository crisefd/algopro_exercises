defmodule AddNumbersAsLinkedLists do
	
	def run(a, b) do
		helper(a, b, 0, []) |> Enum.reverse
	end

	defp helper(a, b, carry_over, result)

	defp helper([], [], _, result), do: result

	defp helper([digit_a | a], [digit_b | b], carry_over, result) do
		case Integer.digits(digit_a + digit_b + carry_over) do
			[sum] -> helper(a, b, carry_over, [sum | result])
			[part1, part2] -> helper(a, b, part1, [part2 | result])
		end
	end

	defp helper([] = a, [digit_b | b], carry_over, result) do
		case Integer.digits( digit_b + carry_over) do
			[sum] -> helper(a, b, carry_over, [sum | result])
			[part1, part2] -> helper(a, b, part1, [part2 | result])
		end
	end

	defp helper([digit_a | a], [] = b, carry_over, result) do
		case Integer.digits( digit_a + carry_over) do
			[sum] -> helper(a, b, carry_over, [sum | result])
			[part1, part2] -> helper(a, b, part1, [part2 | result])
		end
	end

end


IO.inspect AddNumbersAsLinkedLists.run [2, 4, 3], [5, 6, 4]

IO.inspect AddNumbersAsLinkedLists.run [2, 1], [2]

IO.inspect AddNumbersAsLinkedLists.run [2], [9, 1] 