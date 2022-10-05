defmodule ExMonApiWeb.TrainerPokemonsView do
  use ExMonApiWeb, :view
  alias ExMonApi.Trainer.Pokemon

  def render("create.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at,
  weight: weight,
  types: types,
  nickname: nickname,
  trainer_id: trainer_id}}) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at,
  weight: weight,
  types: types,
  nickname: nickname,
  trainer: %{id: trainer_id, name: trainer_name }}}) do
    %{
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer: %{trainer_id: trainer_id, name: trainer_name }
      }
    }
  end

  def render("update.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at,
  weight: weight,
  types: types,
  nickname: nickname,
  trainer_id: trainer_id}}) do
    %{
      message: "Pokemon updated!",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        weight: weight,
        types: types,
        nickname: nickname,
        trainer_id: trainer_id
      }
    }
  end

end
