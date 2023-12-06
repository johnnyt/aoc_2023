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
