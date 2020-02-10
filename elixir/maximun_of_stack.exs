defmodule MaximunOfStack do

	defstruct stack: [], maxes: [] 


	def push(%MaximunOfStack{ stack: [], maxes: []}, item) do
		%MaximunOfStack{ stack: [item], maxes: [item]}
	end

	def push(%MaximunOfStack{ stack: stack, maxes: [ max | rest_maxes] = maxes}, item) do
		%MaximunOfStack{ stack: [item | stack],
										 maxes: (if item > max, do: [item, max | rest_maxes], else: [ max | maxes ])
										}
	end

	def pop(%MaximunOfStack{stack: [item | stack], maxes: [max | maxes]})  do  
		{ {item, max},  %MaximunOfStack{stack: stack, maxes: maxes} } 
	end

	def max(%MaximunOfStack{maxes: [max | _]}), do: max

	
	
end

my_stack = 
%MaximunOfStack{ stack: [], maxes: []}
|> MaximunOfStack.push(1)
|> MaximunOfStack.push(2)
|> MaximunOfStack.push(3)
|> MaximunOfStack.push(2)

IO.puts "after push = #{inspect my_stack}"

{ _, my_stack } = my_stack |> MaximunOfStack.pop()

IO.puts "after pop = #{inspect my_stack}"



{ _, my_stack } = my_stack |> MaximunOfStack.pop()

IO.puts "after pop = #{inspect my_stack}"

