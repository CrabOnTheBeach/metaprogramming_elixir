defmodule CleanSetter do
  defmacro bind_name(string) do
    quote do
      name = unquote(string)
    end
  end
end

defmodule DirtySetter do
  defmacro bind_name(string) do
    quote do
      var!(name) = unquote(string)
    end
  end
end

#in iex:
#name = "Chris"
#CleanSetter.bind_name("Max")
#
#name is still "Chris"
#
#DirtySetter.bind_name("Max")
#
#name is "Max" now
