defmodule Aoc2021Day2 do
  @moduledoc """
  Documentation for `Aoc2021Day2`.
  """
  @doc """
    Changes {x, y} coordinates by amount based on direction.

    ## Examples
      iex> Aoc2021Day2.move_direction("forward", 2, {0, 0})
      {2, 0}

      iex> Aoc2021Day2.move_direction("down", 2, {0, 0})
      {0, -2}

      iex> Aoc2021Day2.move_direction("up", 2, {0, 0})
      {0, 2}
  """
  def move_direction("forward", amount, {x, y}) do
    {x + amount, y}
  end

  def move_direction("down", amount, {x, y}) do
    {x, y + amount}
  end

  def move_direction("up", amount, {x, y}) do
    {x, y - amount}
  end

  @doc """
    Iterate over directions and calculate final {x, y} coordinates.
    Begins at {0, 0}.
  """
  def move(list) when is_list(list) do
    coordinates = {0, 0}
    # Iterate over each list of directions and update the coordinates.
    Enum.reduce(list, coordinates, fn x, acc ->
      [direction, amount] = String.split(x)
      move_direction(direction, String.to_integer(amount), acc)
    end)
  end

  def multiply({x, y}), do: x * y

  @doc """
  Entrypoint for day 2 puzzle: https://adventofcode.com/2021/day/2

  ## Examples

      iex> Aoc2021Day2.main("input.txt")
  """
  def main(input) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
    |> move()
    |> multiply()
  end
end
