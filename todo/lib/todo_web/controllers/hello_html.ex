defmodule TodoWeb.HelloHTML do
  use TodoWeb, :html

  embed_templates "hello_html/*"
end
