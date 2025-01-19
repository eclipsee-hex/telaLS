defmodule TelaWeb.ErrorJSON do
  import Ecto.Changeset
  
  def translate_changeset_errors(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&translate_error/1)  # Traduz cada erro
    |> Enum.into(%{})  # Transforma a lista de erros em um mapa
  end

  # Função para traduzir cada erro individual
  defp translate_error({msg, opts}) do
    # customizar como deseja tratar cada tipo de erro
    # Exemplo: usando os campos de opções para customizar a tradução do erro
    case msg do
      "can't be blank" -> "não pode ser vazio"
      "is invalid" -> "é inválido"
      "is too short" -> "é muito curto"
      "is too long" -> "é muito longo"
      _ -> msg
    end
  end

  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
