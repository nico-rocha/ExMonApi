defmodule ExMonApiWeb.FallbackController do
  use ExMonApiWeb, :controller

  def call(conn, {:error, %{status: status} = result}) do
    conn
    |> put_status(status)
    |> put_view(ExMonApiWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
