defmodule Tela.ProdutosTest do
  use Tela.DataCase

  alias Tela.Produtos

  describe "produtos" do
    alias Tela.Produtos.Produto

    import Tela.ProdutosFixtures

    @invalid_attrs %{descricao: nil, data_validade: nil, data_cadastro: nil, preco: nil}

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Produtos.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Produtos.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      valid_attrs = %{descricao: "some descricao", data_validade: ~D[2025-01-17], data_cadastro: ~D[2025-01-17], preco: "120.5"}

      assert {:ok, %Produto{} = produto} = Produtos.create_produto(valid_attrs)
      assert produto.descricao == "some descricao"
      assert produto.data_validade == ~D[2025-01-17]
      assert produto.data_cadastro == ~D[2025-01-17]
      assert produto.preco == Decimal.new("120.5")
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Produtos.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      update_attrs = %{descricao: "some updated descricao", data_validade: ~D[2025-01-18], data_cadastro: ~D[2025-01-18], preco: "456.7"}

      assert {:ok, %Produto{} = produto} = Produtos.update_produto(produto, update_attrs)
      assert produto.descricao == "some updated descricao"
      assert produto.data_validade == ~D[2025-01-18]
      assert produto.data_cadastro == ~D[2025-01-18]
      assert produto.preco == Decimal.new("456.7")
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Produtos.update_produto(produto, @invalid_attrs)
      assert produto == Produtos.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Produtos.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Produtos.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Produtos.change_produto(produto)
    end
  end
end
