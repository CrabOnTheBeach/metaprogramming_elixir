defmodule Math do
  #Note: you can pattern match macro

  defmacro say({:+, _, [left_arg, right_arg]}) do
    quote do
      left_arg = unquote(left_arg)
      right_arg = unquote(right_arg)
      result = left_arg + right_arg
      IO.puts "#{left_arg} plus #{right_arg} is #{result}"
      result
    end
  end

  defmacro say({:*, _, [left_arg, right_arg]}) do
    quote do
      left_arg = unquote(left_arg)
      right_arg = unquote(right_arg)
      result = left_arg * right_arg
      IO.puts "#{left_arg} times #{right_arg} is #{result}"
      result
    end
  end
end
