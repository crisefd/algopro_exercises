defmodule GetRanges do

	def run(sorted_list, target) do
		with first when is_integer(first) <- binary_search(sorted_list, target, 0,
																											tuple_size(sorted_list) - 1, true),
				 last  when is_integer(last)  <- binary_search(sorted_list, target, 0,
				 																						  tuple_size(sorted_list) - 1, false) 
		do
			{first, last}
		else _ ->
			:failure
		end
	end

	def binary_search(list, target, start, fin, searching_first?) do
		diff =  fin - start
		middle =  div( diff, 2) + start
		item = at(list, middle)
		case diff do
			1 -> 
				if item == target do
					middle
				end
			0 -> :not_found
			_ ->
				
				cond do
					searching_first? ->
						binary_search_helper(list, item, at(list, middle - 1), target, middle, start, fin, searching_first?)
					true -> 
						binary_search_helper(list, item, at(list, middle + 1), target, middle, start, fin, searching_first?)
				end
		end
	end

	defp binary_search_helper(list, item, adjacent_item, target, middle, start, fin, searching_first?) do
		cond do
			item && adjacent_item && adjacent_item != item && item == target ->
				middle
			true -> 
				cond do
				 (item > target and not searching_first?) or (item >= target and searching_first?)  ->
				 		binary_search(list, target, start, middle, searching_first?)
				 (item <= target and not searching_first?) or (item < target and searching_first?) ->
						binary_search(list, target, middle, fin, searching_first?)
				end
		end
	end

	defp at(tuple, position) do
		
		try do
			elem(tuple, position)
		rescue ArgumenError ->
			nil
		end
	end

end


 IO.inspect GetRanges.run {-5, -2, 0, 9, 9, 9, 9, 50}, 9
 IO.inspect GetRanges.run {-5, -2, 0, 0, 7, 9, 20, 50}, 0
 IO.inspect GetRanges.run {-5, -5, -5,  -2, -1, 0, 7, 9, 20, 50}, -5



