defmodule Tela.WebFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tela.Web` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        index.html: "some index.html"
      })
      |> Tela.Web.create_page()

    page
  end
end
