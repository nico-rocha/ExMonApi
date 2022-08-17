defmodule ExMonApi.Pokemon.Get do
  alias ExMonApi.PokeApi.Client
  alias ExMonApi.Pokemon

  def call(name) do
    name
    |> Client.get_pokemon()
    |> handle_response()
  end

  def handle_response({:ok, body}), do: {:ok, Pokemon.build(body)}
  def handle_response({:error, {:message, status: 404}} = error), do: error
  def handle_response({:error, _reason} = error), do: error
end
