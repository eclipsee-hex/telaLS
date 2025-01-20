defmodule Tela.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :descricao, :data_validade, :data_cadastro, :preco]}
  schema "produtos" do
    field :descricao, :string
    field :data_validade, :date
    field :data_cadastro, :date
    field :preco, :decimal

    timestamps()
  end
"""
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:descricao, :data_validade, :data_cadastro, :preco])
    |> validate_required([:descricao, :data_validade, :data_cadastro, :preco])
    |> validate_length(:descricao, max: 50)
    |> validate_preco()
    |> parse_date(:data_cadastro)
    |> parse_date(:data_validade)
  end
"""
  def changeset(produto, attrs) do
    attrs =
      attrs
      |> normalize_date(:data_validade)
      |> normalize_date(:data_cadastro)

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
      add_error(changeset, :preco, "Deve ser maior que 0")
    end
  end
 
"""
  defp parse_date(changeset, field) do
    case get_change(changeset, field) do
      nil ->
        changeset

      date_string when is_binary(date_string) ->
        case parse_date_format(date_string) do
          {:ok, date} -> put_change(changeset, field, date)
          :error -> add_error(changeset, field, "invalid date format (expected dd/MM/YYYY)")
        end

      _ ->
        changeset
    end
  end

  defp parse_date_format(date_string) do
    case Regex.run(~r/^(\d{2})\/(\d{2})\/(\d{4})$/, date_string) do
      [_, day, month, year] ->
        day = String.to_integer(day)
        month = String.to_integer(month)
        year = String.to_integer(year)

        Date.new(year, month, day)

      _ ->
        :error
    end
  end
"""
  defp normalize_date(attrs, field) do
    case Map.get(attrs, field) do
      nil ->
        attrs

      date_string when is_binary(date_string) ->
        case parse_date_format(date_string) do
          {:ok, date} -> Map.put(attrs, field, date)
          :error -> attrs
        end

      _ ->
        attrs
    end
  end

  defp parse_date_format(date_string) do
    case Regex.run(~r/^(\d{2})\/(\d{2})\/(\d{4})$/, date_string) do
      [_, day, month, year] ->
        day = String.to_integer(day)
        month = String.to_integer(month)
        year = String.to_integer(year)

        Date.new(year, month, day)

      _ ->
        :error
    end
  end
end
