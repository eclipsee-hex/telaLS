defmodule Tela.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :descricao, :string
      add :data_validade, :date
      add :data_cadastro, :date
      add :preco, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
