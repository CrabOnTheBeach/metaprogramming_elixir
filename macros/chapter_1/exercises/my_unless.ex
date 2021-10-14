defmodule MyUnless do
  defmacro unless(expression, do: block) do
    quote do
      case unquote(expression) do
        x when x in [false, nil] ->
          unquote(block)

        _ ->
          nil
      end
    end
  end
end
