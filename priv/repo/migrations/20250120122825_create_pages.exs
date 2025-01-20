defmodule Tela.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :"index.html", :string

      timestamps(type: :utc_datetime)
    end
  end
end
