# live-auction

Resilient auction web app written in Elixir!

Starting up the Auction repo

```bash
iex -S mix
```

```elixir
iex(1)> Auction.Repo.start_link
{:ok, #PID<0.375.0>}
iex(2)> Auction.list_items
```

Insert data

```Elixir
{:ok, item} =
  Auction.insert_item(
    %{
      title: "Red Umbrella",
      description: "Keeps you dry and stylish!",
      ends_at: DateTime.from_naive!(~N[2021-08-22 11:43:39], "Etc/UTC")
    }
  )

#02:37:33.685 [debug] QUERY OK db=2.8ms queue=0.5ms idle=1849.0ms
#INSERT INTO "items" ("description","ends_at","title","inserted_at","updated_at") VALUES ($1,$2,$3,$4,$5) RETURNING "id" ["Keeps you dry and stylish!", ~U[2021-08-22 11:43:39Z], "Red Umbrella", ~N[2021-07-26 02:37:33], ~N[2021-07-26 02:37:33]]

#{:ok,
 #%Auction.Item{
   #__meta__: #Ecto.Schema.Metadata<:loaded, "items">,
   #description: "Keeps you dry and stylish!",
   #ends_at: ~U[2021-08-22 11:43:39Z],
   #id: 1,
   #inserted_at: ~N[2021-07-26 02:37:33],
   #title: "Red Umbrella",
   #updated_at: ~N[2021-07-26 02:37:33]
 #}}
```

Get auction items

```elixir
Auction.list_items
#02:38:53.566 [debug] QUERY OK source="items" db=1.5ms idle=1732.0ms
#SELECT i0."id", i0."title", i0."description", i0."ends_at", i0."inserted_at", i0."updated_at" FROM "items" AS i0 []
#[
  #%Auction.Item{
    #__meta__: #Ecto.Schema.Metadata<:loaded, "items">,
    #description: "Keeps you dry and stylish!",
    #ends_at: ~U[2021-08-22 11:43:39Z],
    #id: 1,
    #inserted_at: ~N[2021-07-26 02:37:33],
    #title: "Red Umbrella",
    #updated_at: ~N[2021-07-26 02:37:33]
  #}
#]
```

```elixir
Auction.get_item(1)
#02:40:41.576 [debug] QUERY OK source="items" db=0.4ms queue=0.5ms idle=742.6ms
#SELECT i0."id", i0."title", i0."description", i0."ends_at", i0."inserted_at", i0."updated_at" FROM "items" AS i0 WHERE (i0."id" = $1) [1]
#%Auction.Item{
  #__meta__: #Ecto.Schema.Metadata<:loaded, "items">,
  #description: "Keeps you dry and stylish!",
  #ends_at: ~U[2021-08-22 11:43:39Z],
  #id: 1,
  #inserted_at: ~N[2021-07-26 02:37:33],
  #title: "Red Umbrella",
  #updated_at: ~N[2021-07-26 02:37:33]
#}
```