defmodule ExMonApi.PokemonTest do
  use ExMonApi.DataCase

  alias ExMonApi.Trainer.Pokemon

  describe "changeset/1" do
    test "when all params are valid returns a valid changeset" do
      params = %{name: "pikachu", nickname: "julio", weight: 60, types: ["electric"], trainer_id: "b0017870-1dec-40c6-80c6-66475ea9c57d"}

      response = Pokemon.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "pikachu",
          nickname: "julio",
          weight: 60,
          types: ["electric"],
          trainer_id: "b0017870-1dec-40c6-80c6-66475ea9c57d"
        },
        errors: [],
        data: %ExMonApi.Trainer.Pokemon{},
        valid?: true
      } = response
    end

    test "when all params are invalid returns a invalid changeset" do
      params = %{name: "pikachu", nickname: "julio", weight: 60, types: ["electric"]}

      response = Pokemon.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "pikachu",
          nickname: "julio",
          weight: 60,
          types: ["electric"]
        },
        data: %ExMonApi.Trainer.Pokemon{},
        valid?: false
      } = response

      assert errors_on(response) == %{trainer_id: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid returns a valid pokemon struct" do
      params = %{name: "pikachu", nickname: "julio", weight: 60, types: ["electric"], trainer_id: "b0017870-1dec-40c6-80c6-66475ea9c57d"}

      response = Pokemon.build(params)

      assert {:ok, %Pokemon{name: "pikachu", nickname: "julio", weight: 60, types: ["electric"], trainer_id: "b0017870-1dec-40c6-80c6-66475ea9c57d"}} = response
    end

    test "when all params are invalid returns an error" do
      params = %{name: "pikachu", nickname: "julio", weight: 60, types: ["electric"]}

      {:error, response} = Pokemon.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{trainer_id: ["can't be blank"]}
    end
  end
end
