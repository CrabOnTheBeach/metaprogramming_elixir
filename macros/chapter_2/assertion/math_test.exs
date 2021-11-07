defmodule MathTest do
  use Assertion

  test "integers can be added and subtracted" do
    assert 1 + 1 == 2
    assert 5 - 2 == 3
    assert 5 - 0 == 5
  end

  test "test that fails" do
    assert 5 == 0
  end

  test "test that dont fails, but should" do
    assert 5 == 0
    assert 5 == 5
  end
end
