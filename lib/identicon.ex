defmodule Identicon do
  def main(input) do
    input 
    |> hash_input
    |> pick_color
  end

  def pick_color(image) do
    # disregard all elements after first three
    %Identicon.Image{hex: [r, g, b | _tail ]} = image 
    [r, g, b]
  end

  def hash_input(input) do
    hex = :crypto.hash(:sha256, input)
    |> :binary.bin_to_list 
    %Identicon.Image{hex: hex}
  end
end
