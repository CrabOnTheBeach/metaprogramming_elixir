defmodule MyRawMacro do
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
