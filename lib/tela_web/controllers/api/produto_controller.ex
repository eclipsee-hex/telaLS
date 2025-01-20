defmodule TelaWeb.Api.ProdutoController do
  use TelaWeb, :controller
  alias Tela.Produtos
  alias Tela.Produtos.Produto

  # FallbackController para tratar erros
  action_fallback TelaWeb.FallbackController

  # Lista 
  def index(conn, _params) do
    produtos = Produtos.list_produtos()
    json(conn, produtos)
  end  

  # Cria 
  def create(conn, %{"produto" => produto_params}) do
    # Tenta criar o produto com os parâmetros fornecidos
    with {:ok, %Produto{} = produto} <- Produtos.create_produto(produto_params) do
      conn
      |> put_status(:created)  # Status HTTP 201
      |> put_resp_header("location", Routes.produto_path(conn, :show, produto))  # Header de localização
      |> json(produto)  
    end
  end

  # Exibe 
  def show(conn, %{"id" => id}) do
    produto = Produtos.get_produto!(id)  # Garante que o produto será encontrado ou dispara um erro
    json(conn, produto)  
  end

  # Atualiza 
  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Produtos.get_produto!(id)  # Busca o produto pelo ID

    # Tenta atualizar o produto com os novos parâmetros
    with {:ok, %Produto{} = produto} <- Produtos.update_produto(produto, produto_params) do
      json(conn, produto) 
  end

  # Exclui 
  def delete(conn, %{"id" => id}) do
    produto = Produtos.get_produto!(id)  # Busca o produto pelo ID

    # Tenta excluir o produto
    with {:ok, %Produto{}} <- Produtos.delete_produto(produto) do
      send_resp(conn, :no_content, "")  # Retorna um status HTTP 204 (sem conteúdo)
    end
  end
end