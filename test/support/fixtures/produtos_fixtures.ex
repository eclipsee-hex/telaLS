defmodule Tela.ProdutosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tela.Produtos` context.
  """

  @doc """
  Generate a produto.
  """
  def produto_fixture(attrs \\ %{}) do
    {:ok, produto} =
      attrs
      |> Enum.into(%{
        data_cadastro: ~D[2025-01-17],
        data_validade: ~D[2025-01-17],
        descricao: "some descricao",
        preco: "120.5"
      })
      |> Tela.Produtos.create_produto()

    produto
  end
end
