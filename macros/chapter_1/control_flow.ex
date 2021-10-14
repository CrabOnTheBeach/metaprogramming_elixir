defmodule ControlFlow do
  @moduledoc """
  Micro features:
  Macro.expand_once(ast_result, __ENV__) expands ast result once
  """
  @doc """
  Some types in elixir doesn't change after being quoted
  These types are:
  1. atom
  2. integer
  3. float
  4. String
  5. typle
  6. list
  7. and any superposition of things listed above
  For example:
  quote do: {:ok, [1, 2, 3.14]}
  returns {:ok, [1, 2, 3.14]}
  And this feature used in macro below to match do block
  """
  defmacro unless(expression, do: block) do
    quote do
      if !unquote(expression), do: unquote(block)
    end
  end
end
