defmodule FindNonDuplicateNumber do
	use Bitwise, only_operators: true

	def run([ first | rest]) do
		rest
		|> Enum.reduce(first, fn number, result -> 
			 number ^^^ result 
		end)
	end
end



IO.inspect FindNonDuplicateNumber.run [4, 3, 2, 4, 6, 3, 2]