defmodule CourseSchedule do

	def can_finish(prerrequisites) do
		{ graph, vertices } = get_graph prerrequisites
		can_finish(graph, vertices)
	end

	defp can_finish(_, []), do: true

	defp can_finish(graph, [vertext | vertices]) do
		if visit(graph, vertext) do
			false
		else
			can_finish(graph, vertices)
		end
	end

	defp get_graph(prerrequisites) do
		get_graph(prerrequisites, %{}, [])
	end

	defp get_graph([], graph, vertices), do: {graph, vertices}

	defp get_graph([ {vertex,  neighbour} | prerrequisites], graph, vertices) do
		graph = Map.update(graph, vertex, [neighbour], &([ neighbour | &1]))
		get_graph(prerrequisites, graph, [vertex | vertices])
	end

	defp visit(graph, vertex, visited \\ MapSet.new()) do
		look_for_cycle(graph[vertex], MapSet.put(visited, vertex), graph)
	end

	defp look_for_cycle(neighbours, visited, graph) do
		case neighbours do
			[ neighbour | neighbours] ->
				if MapSet.member?(visited, neighbour) or visit(graph, neighbour, visited) do
					true
				else
					look_for_cycle(neighbours, visited , graph)
				end
			_ ->
				false
		end
	end

end


IO.inspect CourseSchedule.can_finish([{1, 0}])
IO.inspect CourseSchedule.can_finish([{1, 0}, {0, 1}])