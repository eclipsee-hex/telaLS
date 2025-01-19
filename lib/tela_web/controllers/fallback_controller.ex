defmodule TelaWeb.FallbackController do
    use TelaWeb, :controller
    alias TelaWeb.ErrorJSON
  
    # Função para capturar erros do Changeset
    def call(conn, {:error, %Ecto.Changeset{}} = error) do
      # Traduz os erros do changeset utilizando a função que criamos
      errors = ErrorJSON.translate_changeset_errors(error)
  
      conn
      |> put_status(:unprocessable_entity)
      |> json(errors)  # Envia os erros traduzidos como resposta JSON
    end
  
    # Caso o produto não seja encontrado
    def call(conn, {:error, :not_found}) do
      conn
      |> put_status(:not_found)
      |> json(%{error: "Resource not found"})
    end
  
    # Para qualquer outro erro não esperado
    def call(conn, _error) do
      conn
      |> put_status(:internal_server_error)
      |> json(%{error: "Internal server error"})
    end
  end
  