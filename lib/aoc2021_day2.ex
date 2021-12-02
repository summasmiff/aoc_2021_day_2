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

  def move_direction("forward", amount, {x, aim, depth}) do
    depth_calculation = aim * amount
    {x + amount, aim, depth + depth_calculation}
  end

  def move_direction("down", amount, {x, y}) do
    {x, y + amount}
  end

  def move_direction("down", amount, {x, aim, depth}) do
    {x, aim + amount, depth}
  end

  def move_direction("up", amount, {x, y}) do
    {x, y - amount}
  end

  def move_direction("up", amount, {x, aim, depth}) do
    {x, aim - amount, depth}
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

  def move_and_aim(list) when is_list(list) do
    # {x, y, aim}
    coordinates = {0, 0, 0}

    Enum.reduce(list, coordinates, fn x, acc ->
      [direction, amount] = String.split(x)
      move_direction(direction, String.to_integer(amount), acc)
    end)
  end

  def multiply({x, y}), do: x * y

  @doc """
  Entrypoint for day 2 puzzle: https://adventofcode.com/2021/day/2

  ## Examples

      iex> Aoc2021Day2.part_one("input.txt")
  """
  def part_one(input) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
    |> move()
    |> multiply()
  end

  @doc """
  Entrypoint for part 2 puzzle: https://adventofcode.com/2021/day/2#part2

  ## Examples

      iex> Aoc2021Day2.part_two("input.txt")
  """
  def part_two(input) do
    {x, _aim, depth} =
      input
      |> File.read!()
      |> String.split("\n", trim: true)
      |> move_and_aim()

    x * depth
  end
end
