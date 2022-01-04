defmodule Assertion do
  @doc """
    quote do bind_quoted: [binding1: binding2, binding2: binding2 ...] do
       ...
    end
  is equal to:
    quote do
      binding1 = unquote(binding1)
      binding2 = unquote(binding2)
      ...
    end
  it is used to avoid errors in multiple unquote calls
  """
  defmacro assert({operator, _context, [left, right]}) do
    quote bind_quoted: [operator: operator, left: left, right: right] do
      Assertion.Test.assert(operator, left, right)
    end
  end
end

