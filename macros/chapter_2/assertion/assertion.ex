defmodule Assertion do
  @doc """
  __using__ is a special macro that invoked by `use` keyword
  """
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      #create module attribute @tests and allow to acumulate data in it
      Module.register_attribute __MODULE__, :tests, accumulate: true
      #The @before_compile attribute accepts a module argument where
      #a __before_compile__/1 macro must be defined.
      #This macro is invoked just before compilation in order to perform
      #a final bit of code generation.
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        Assertion.Test.run(@tests, __MODULE__)
      end
    end
  end

  defmacro test(description, do: test_block) do
    test_func = String.to_atom(description)
    quote do
      @tests {unquote(test_func), unquote(description)}
      def unquote(test_func)(), do: unquote(test_block)
    end
  end

  defmacro assert({operator, _context, [left, right]}) do
    quote bind_quoted: [operator: operator, left: left, right: right] do
      Assertion.Test.assert(operator, left, right)
    end
  end
  defmacro assert(primitive) do
    quote bind_quoted: [primitive: primitive] do
      Assertion.Test.assert(primitive)
    end
  end
end
