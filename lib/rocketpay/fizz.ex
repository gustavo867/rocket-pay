defmodule Rocketpay.FizzBuzz do
  def fizz(x) when rem(x, 3)==0, do: :fizz
  def fizz(x), do: x

  def buzz(x) when rem(x, 5) == 0, do: :buzz
  def buzz(x), do: x

  def fizzbuzz_aux(:fizz,:buzz), do: :fizzbuzz
  def fizzbuzz_aux(:fizz,_), do: :fizz
  def fizzbuzz_aux(_,:buzz), do: :buzz
  def fizzbuzz_aux(x,_), do: x

  def fizzbuzz(x), do: fizzbuzz_aux(fizz(x),buzz(x))

  def call(x) do
    for n <- 1..x, do: fizzbuzz(n)
  end
end
