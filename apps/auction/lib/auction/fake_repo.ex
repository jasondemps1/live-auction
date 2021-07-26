defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "Top Gun: The Musical",
      description: "The most explosive soundtrack you've ever witnessed.",
      ends_at: ~N[2021-09-25 05:22:29]
    },
    %Item{
      id: 2,
      title: "Red Umbrella",
      description: "Keeps you dry and stylish!",
      ends_at: DateTime.from_naive!(~N[2021-08-22 11:43:39], "Etc/UTC")
    },
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id == id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
