defmodule MyRawMacro do
  @doc """
  Exercies is: write your own macro without using `quote`
  """
  defmacro invert_operator({:+, context, [left_arg, right_arg]}) do
    {:-, context, [left_arg, right_arg]}
  end
  defmacro invert_operator({:-, context, [left_arg, right_arg]}) do
    {:+, context, [left_arg, right_arg]}
  end
  defmacro invert_operator({:*, context, [left_arg, right_arg]}) do
    {:/, context, [left_arg, right_arg]}
  end
  defmacro invert_operator({:/, context, [left_arg, right_arg]}) do
    {:*, context, [left_arg, right_arg]}
  end
end
