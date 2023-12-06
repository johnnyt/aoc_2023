defmodule AOC.InputFiles do
  @moduledoc """
  Reads input files for puzzles
  """

  def read(day) when is_binary(day) do
    File.read!("lib/aoc/input_files/day_#{day}.txt")
  end

  def read(module) do
    filename =
      module
      |> Atom.to_string()
      |> String.split(".")
      |> List.last()

    File.read!("lib/aoc/input_files/#{filename}.txt")
  end
end
