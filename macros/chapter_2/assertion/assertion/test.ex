defmodule Assertion.Test do
  def run(tests, module) do
    Enum.each(tests, fn {test_func, description} ->
      case apply(module, test_func, []) do
        :ok             -> IO.puts("OK")
        {:fail, reason} -> IO.write(
          #TODO: change """ with sigil
          """
          ===================================================
          FAILURE: #{description}
          ===================================================
          #{reason}
          """)
      end
    end)
  end

  def assert(:==, left, right) when left == right do
    :ok
  end
  def assert(:==, left, right) do
    #TODO change """ with sigil
    reason =
      """
      Expected left:        #{inspect(left)}
      to be equal to right: #{inspect(right)}
      """
    {:fail, reason}
  end
  def assert(:>, left, right) when left > right do
    :ok
  end
  def assert(:>, left, right) do
    #TODO change """ with sigil
    reason =
      """
      Expected left:        #{inspect(left)}
      to be equal to right: #{inspect(right)}
      """
    {:fail, reason}
  end
end
