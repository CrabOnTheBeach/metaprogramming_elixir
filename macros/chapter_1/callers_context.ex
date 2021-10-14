defmodule Mod do
  defmacro definfo do
    IO.puts "In macro's context (#{__MODULE__})"

    quote do
      IO.puts "In caller's context (#{__MODULE__})"

      #__info__ requires old an elixir version(with 1.7.4 it works,
      #with1.12 gives compilation error that info should be changed with
      #__MODULE__.__info__
      def friendy_info do
        IO.puts """
          My name is #{__MODULE__}
          My functions are #{inspect __info__(:functions)}
        """
      end
    end
  end
end

defmodule MyModule do
  require Mod
  Mod.definfo
end
