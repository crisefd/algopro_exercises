defmodule ReverseLinkedList do
	
	def reverse(list), do: reverse(list, [])

	def reverse([], result), do: result

	def reverse([head | rest], result), do: reverse(rest, [head | result])

end


IO.inspect ReverseLinkedList.reverse [1, 2, 3, 4, 5]