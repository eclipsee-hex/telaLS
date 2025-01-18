defmodule Tela.Repo.Migrations.AlterPrecoType do
  use Ecto.Migration

  def change do
    alter table(:produtos) do
      modify :preco, :numeric, precision: 13, scale: 2
    end
  end
end
