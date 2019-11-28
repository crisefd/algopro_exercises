defmodule ValidateBST do

	def run(tree) do
		 lower = fn value -> value - 1 end
		 upper = fn value -> value + 1 end
		 helper(tree, lower, upper)
	end

	defp helper(a_node, lower, upper)

	defp helper(nil, _, _), do: true

	defp helper([value, left, right], lower, upper) when is_function(lower) and is_function(upper) do
		cond do
		 value not in lower.(value)..upper.(value) -> false
		 true -> helper(left, lower, value) and helper(right, value, upper)
		end
	end

	defp helper([value, left, right], lower, upper) when is_function(lower) do
		cond do
		 value not in lower.(value)..upper -> false
		 true -> helper(left, lower , value) and helper(right, value, upper)
		end
	end

	defp helper([value, left, right], lower, upper) when is_function(upper)  do
		cond do
		 value not in lower..upper.(value) -> false
		 true -> helper(left, lower , value) and helper(right, value, upper)
		end
	end

	defp helper([value, left, right], lower, upper) do
		cond do
		 value not in lower..upper -> false
		 true -> helper(left, lower , value) and helper(right, value, upper)
		end
	end

	defp helper(_, _, _), do: true

end

tree_1 = [8, [3, [1, nil, nil], [6, [4, nil, nil], [7, nil, nil]]],
             [10, nil, [14, [13, nil, nil], nil], nil ]]

tree_2 = [4, [2, [1, nil, nil], [3, nil, nil]], [5, nil, nil]]

IO.inspect ValidateBST.run tree_1
IO.inspect ValidateBST.run tree_2
