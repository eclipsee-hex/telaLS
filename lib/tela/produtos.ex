defmodule Tela.Produtos do
  alias Tela.Repo
  alias Tela.Produtos.Produto


  @doc """
  Listar todos os produtos.
  """
  def list_produtos do
    Repo.all(Produto)
  end

  @doc """
  Criar um novo produto.
  """
  def create_produto(attrs) do
    %Produto{}
    |> Produto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Atualizar um produto existente.
  """
  def update_produto(%Produto{} = produto, attrs) do
    produto
    |> Produto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletar um produto.
  """
  def delete_produto(%Produto{} = produto) do
    Repo.delete(produto)
  end

  @doc """
  Encontrar um produto pelo ID.
  """
  def get_produto!(id) do
    Repo.get!(Produto, id)
  end
end