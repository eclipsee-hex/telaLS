defmodule Tela.Repo.Migrations.AlterTableProdutos4 do
  use Ecto.Migration

  def change do
    alter table :produtos do
      modify :preco, :numeric, precision: 10, scale: 2
    end
  end
end
