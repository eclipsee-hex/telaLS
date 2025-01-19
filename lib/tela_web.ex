defmodule TelaWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: TelaWeb
      import Plug.Conn
      alias TelaWeb.Router.Helpers, as: Routes
    end
  end

  def static_paths do
    ~w(assets fonts images favicon.ico robots.txt)
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/tela_web/templates",
        namespace: TelaWeb
      
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Import common functionality
      unquote(view_helpers())
    end
  end

  defp view_helpers do
    quote do
      # Funções úteis disponíveis nas views
      import Phoenix.View
      import TelaWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
