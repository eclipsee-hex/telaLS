defmodule Tela.Repo.Migrations.AlterTableProdutosPreco2 do
  use Ecto.Migration

  def change do
    alter table (:produtos) do
      modify :preco, :decimal
    end
  end
end
