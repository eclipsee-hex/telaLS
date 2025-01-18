defmodule Tela.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :descricao, :string
    field :data_validade, :date
    field :data_cadastro, :date
    field :preco, :decimal

    timestamps()
  end

  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:descricao, :data_validade, :data_cadastro, :preco])
    |> validate_required([:descricao, :data_validade, :data_cadastro, :preco])
    |> validate_length(:descricao, max: 50)
    |> validate_preco()
  end

  defp validate_preco(changeset) do
    preco = get_field(changeset, :preco)

    if is_nil(preco) or Decimal.cmp(preco, Decimal.new(0)) == :gt do
      changeset
    else
      add_error(changeset, :preco, "must be greater than 0")
    end
  end
end