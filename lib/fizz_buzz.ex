defmodule FizzBuzz do
  def build(fileName) do
    fileName
    |> File.read()
    |> handleFileRead()
  end

  defp handleFileRead({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convertAndEvaluateNumbers/1)

    {:ok, result}
  end

  defp handleFileRead({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convertAndEvaluateNumbers(elem) do
    elem
    |> String.to_integer()
    |> evaluateNumbers()
  end

  defp evaluateNumbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluateNumbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluateNumbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluateNumbers(number), do: number
end
