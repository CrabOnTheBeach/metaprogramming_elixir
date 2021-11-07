defmodule Assertion.Test do
  def assert(:==, left, right) when left == right do
    IO.puts("OK")
  end
  def assert(:==, left, right) do
    IO.puts("Failure:")
    IO.puts("Expected left:        #{inspect(left)}")
    IO.puts("to be equal to right: #{inspect(right)}")
  end
  def assert(:>, left, right) when left > right do
    IO.puts("OK")
  end
  def assert(:>, left, right) do
    IO.puts("Failure:")
    IO.puts("Expected left:            #{inspect(left)}")
    IO.puts("to be greater than right: #{inspect(right)}")
  end
end
