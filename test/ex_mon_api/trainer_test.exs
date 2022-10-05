defmodule ExMonApi.TrainerTest do
  use ExMonApi.DataCase

  alias ExMonApi.Trainer

  describe "changeset/1" do
    test "when all params are valid returns a valid changeset" do
      params = %{name: "Nico", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          name: "Nico",
          password: "123456"
        },
        errors: [],
        data: %ExMonApi.Trainer{},
        valid?: true
      } = response
    end

    test "when all params are invalid returns a invalid changeset" do
      params = %{password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          password: "123456"
        },
        data: %ExMonApi.Trainer{},
        valid?: false
      } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid returns a valid trainer struct" do
      params = %{name: "Nico", password: "123456"}

      response = Trainer.build(params)

      assert {:ok, %Trainer{name: "Nico", password: "123456"}} = response
    end

    test "when all params are invalid returns an error" do
      params = %{password: "123456"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
