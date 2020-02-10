defmodule ProductOfArrayExceptSelf do
  
  def run(nums) do
    left_result = helper(nums, [1]) |> Enum.reverse()
    right_result = nums |> Enum.reverse() |> helper([1])
    Enum.zip(left_result, right_result)
    |> Enum.reduce([], fn({l, r}, acc) ->
        acc ++ [l * r]
      end)
  end

  def helper([n], result), do: result

  def helper([n | nums], [r | _rest] = result) do
    helper(nums, [ r * n | result ])
  end

end


IO.inspect ProductOfArrayExceptSelf.run [2, 4, 1, 5, 3]