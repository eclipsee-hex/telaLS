defmodule Tela.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :descricao, :string
    field :data_validade, :date
    field :data_cadastro, :date
    field :preco, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:descricao, :data_validade, :data_cadastro, :preco])
    |> validate_required([:descricao, :data_validade, :data_cadastro, :preco])
  end
end
