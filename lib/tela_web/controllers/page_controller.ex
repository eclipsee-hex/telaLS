defmodule TelaWeb.PageController do
  use TelaWeb, :controller

  alias Tela.Web

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, "priv/static/html/index.html")
  end
end
