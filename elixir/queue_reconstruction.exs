defmodule QueueReconstruction do

	def reconstruct(queue) do
		queue
		|> sort_queue_by_height()
		|> sort_queue_by_k([])
	end

	defp sort_queue_by_height(queue) do
		queue |> Enum.sort(fn({h1, _k1}, {h2, _k2}) ->  h1 >= h2  end)
	end

	defp sort_queue_by_k([], result), do: result

	defp sort_queue_by_k([ {_h, k} = item | rest], result) do
		result = result |> List.insert_at(k, item)
		sort_queue_by_k(rest, result)
	end

end


IO.inspect QueueReconstruction.reconstruct [{7, 0}, {4, 4}, {7, 1}, {5, 0}, {6, 1}, {5, 2}]