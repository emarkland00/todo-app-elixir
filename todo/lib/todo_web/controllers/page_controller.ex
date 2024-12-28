defmodule TodoWeb.PageController do
  use TodoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
    #send_resp(conn, 201, "")
    # conn
    # |> put_resp_content_type("text/plain")
    # |> send_resp(201, "")
    # conn
    # |> redirect(to: ~p"/redirect_test")
    #redirect(conn, external: "https://elixir-lang.org/")
    # conn
    # |> put_flash(:info, "Let's pretend we have an error")
    # |> redirect(to: ~p"/redirect_test")
  end

  def redirect_test(conn, _params) do
    conn
    |> render(:home, layout: false)
  end
end
