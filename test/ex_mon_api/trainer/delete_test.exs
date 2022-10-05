defmodule ExMonApi.Trainer.DeleteTest do
  use ExMonApi.DataCase

  alias ExMonApi.{Repo, Trainer}

  alias Ecto.UUID

  alias Trainer.Delete

  describe "call/1" do
    test "when id is valid delete a trainer" do
      param_id = "b0017870-1dec-40c6-80c6-66475ea9c57d"

      assert UUID.cast(param_id) == {:ok, param_id}
    end

    test "when id is invalid returns an error" do
      param_id = "jabsadjasdh"

      response = Delete.call(param_id)

      assert {UUID.cast(param_id), "Invalid ID format!"} == response
    end
  end
end
