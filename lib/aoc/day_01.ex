defmodule AOC.Day01 do
  @moduledoc """
  https://adventofcode.com/2023/day/1
  """

  alias AOC.InputFiles

  def part_1() do
    lines = read_input()

    lines
    |> Enum.map(&parse_digits(&1))
    |> Enum.sum()
  end

  def part_2() do
    lines = read_input()

    lines
    |> Enum.map(&convert_digits(&1))
    |> Enum.map(&parse_digits(&1))
    |> Enum.sum()
  end

  defp convert_digits(input), do: convert_digits(input, "")
  defp convert_digits("", acc), do: acc

  defp convert_digits(<<"one", rest::binary>>, acc), do: convert_digits("e" <> rest, acc <> "1")
  defp convert_digits(<<"two", rest::binary>>, acc), do: convert_digits("o" <> rest, acc <> "2")
  defp convert_digits(<<"three", rest::binary>>, acc), do: convert_digits("e" <> rest, acc <> "3")
  defp convert_digits(<<"four", rest::binary>>, acc), do: convert_digits("r" <> rest, acc <> "4")
  defp convert_digits(<<"five", rest::binary>>, acc), do: convert_digits("e" <> rest, acc <> "5")
  defp convert_digits(<<"six", rest::binary>>, acc), do: convert_digits("x" <> rest, acc <> "6")
  defp convert_digits(<<"seven", rest::binary>>, acc), do: convert_digits("n" <> rest, acc <> "7")
  defp convert_digits(<<"eight", rest::binary>>, acc), do: convert_digits("t" <> rest, acc <> "8")
  defp convert_digits(<<"nine", rest::binary>>, acc), do: convert_digits("e" <> rest, acc <> "9")

  defp convert_digits(<<first_char::binary-size(1), rest::binary>>, acc), do: convert_digits(rest, acc <> first_char)

  defp parse_digits(line) do
    numbers = Regex.scan(~r/\d/, line)
    first = List.first(numbers)
    last = List.last(numbers)

    {int, _rest} = Integer.parse("#{first}#{last}")
    int
  end

  defp read_input() do
    InputFiles.read(__MODULE__)
    |> String.split("\n", trim: true)
  end
end
