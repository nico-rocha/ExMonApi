defmodule ExMonApi.Pokemon.CreateTest do
  # def call(%{"name" => name} = params) do
  #   name
  #   |> Client.get_pokemon()
  #   |> handle_response(params)
  # end
  use ExMonApi.DataCase
  alias ExMonApi.{Trainer, Trainer.Pokemon}
  alias Pokemon.Create

  describe "call/1" do
    test "when name is valid creates a pokemon" do
      params = %{name: "name"}

      count_before = Repo.aggregate(Pokemon, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Pokemon, :count)

      assert {:ok, %Pokemon{name: "Nico"}} = response
      assert count_after > count_before
    end
  end
end
