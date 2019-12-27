defmodule Calculator do

  def run(input) do
    input
    |> String.split()
    |> eval_expression() 
  end

  defp eval_expression(expression) do
    eval_expression(expression, [], []) 
  end

  defp eval_expression([], operators, values) do
     get_final_result(operators, values)
  end

  defp eval_expression([token | expression], operators, values) do
    case token do
     s when s in [" ", ""] ->
        eval_expression(expression, operators, values)
      "(" -> 
        eval_expression(expression, [ :"(" | operators], values)
      ")" -> 
        { new_operators, new_values} = do_when_right_paren(operators, values)
          eval_expression(expression, new_operators, new_values)
       _ -> 
        parsed_token = parse_token(token)
        cond do
          is_atom(parsed_token) ->
            {new_operators, new_values} = do_when_operator(parsed_token, operators, values)
             eval_expression(expression, new_operators, new_values)
          is_number(parsed_token) -> 
            eval_expression(expression, operators, [parsed_token | values])
        end
    end
  end

  defp parse_token(token) do
    case Float.parse(token) do
      :error -> parse_operator(token)
      {number, _} -> number
    end
  end

  defp parse_operator(operator) do
    case operator do
      x when x in ["+", "-", "*", "/"] -> String.to_atom(operator)
      "%" -> :rem
    end
  end

  defp do_when_right_paren([], _) do
    raise("mismatched parentheses")
  end

  defp do_when_right_paren([ :"(" | operators ], values) do
   { operators, values }
  end

  defp do_when_right_paren([ operator | operators ], [ operand1, operand2 | values]) do
    do_when_right_paren(operators,
                        [ apply_function(operator, [operand1, operand2]) | values])
  end

  defp do_when_operator(this_operator, [], values) do
     { [this_operator], values }
  end

  defp do_when_operator(this_operator, [ :"(" | _rest_operators ] = operators, values) do
    { [this_operator | operators], values }
  end

  defp do_when_operator(this_operator, [ operator | operators], [ operand1, operand2 | vals] = values) do
    if  precendence(operator) >= precendence(this_operator) do
       do_when_operator(this_operator,
                        operators,
                        [ apply_function(operator, [operand1, operand2]) 
                          | vals])
    else
      do_when_operator(this_operator, operators, values)
    end
  end

  defp precendence(operator) when is_atom(operator) do
    %{ :+ => 0, :- => 0, :/ => 1, :* => 1, :rem => 1 }
    |> Map.get(operator)
  end

  defp precendence(operator), do: raise("#{operator} is not valid operator")

  defp get_final_result([], [result]), do: result

  defp get_final_result([operator | operators], [operand1, operand2 | values]) do
    get_final_result(operators,
                    [ apply_function(operator, [operand1, operand2]) | values])
  end

  defp apply_function(operator, operands)  do
    operands = 
      case operator do
        :rem -> operands |> Enum.reverse() |> Enum.map(&Kernel.trunc/1)
        y when y in [:+, :-, :*, :/] -> operands |> Enum.reverse()
        _ -> raise("#{operator} is not a valid operator")
      end
    apply(Kernel, operator, operands)
  end

end

IO.puts Calculator.run("2 + 2 + 30") == 34
IO.puts Calculator.run("10 - 5") == 5
IO.puts Calculator.run("5 * 3") == 15
IO.puts Calculator.run("9 / 3") == 3
IO.puts Calculator.run("5 % 2") == 1
IO.puts Calculator.run("( 10 * 2 ) + 2 + 2") == 24