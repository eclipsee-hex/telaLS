defmodule Tela.Web.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :"index.html", :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:"index.html"])
    |> validate_required([:"index.html"])
  end
end
