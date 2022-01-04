defmodule Assertion.Test do
  @operations [:==, :!=, :>, :>=, :<, :<=]

  def run(tests, module) do
    Enum.each(tests, fn {test_func, description} ->
      case apply(module, test_func, []) do
        :ok             -> IO.puts("OK")
        {:fail, reason} -> IO.write(
          """
          ===================================================
          FAILURE: #{description}
          ===================================================
          #{reason}
          """)
      end
    end)
  end

  def assert(:==, left, right) when left == right, do: :ok
  def assert(:!=, left, right) when left != right, do: :ok
  def assert(:>, left, right) when left > right, do: :ok
  def assert(:>=, left, right) when left >= right, do: :ok
  def assert(:<, left, right) when left < right, do: :ok
  def assert(:<=, left, right) when left <= right, do: :ok
  def assert(operation, left, right) when operation in @operations do
    {:fail, error_message(operation, left, right)}
  end
  def assert(true), do: :ok
  def assert(false), do: {:fail, "Asserted false"}

  defp error_message(operation, left, right) when operation in @operations do
    """
    Expecter left: #{inspect(left)}
    To be #{relationship(operation)} right: #{inspect(right)}
    """
  end
  defp error_message(operation, _, _) do
    "Not supported assert operation: #{inspect(operation)}"
  end

  defp relationship(:==), do: "equal to"
  defp relationship(:!=), do: "not equal to"
  defp relationship(:< ), do: "less than"
  defp relationship(:<=), do: "not greater than"
  defp relationship(:> ), do: "grater than"
  defp relationship(:>=), do: "not less than"
end

