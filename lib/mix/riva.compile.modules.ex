defmodule Mix.Tasks.Riva.Compile.Modules do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Compile nvidia riva elixir modules from common proto definitions"

  use Mix.Task

  @switches [
    tag: :string
  ]

  @impl Mix.Task
  def run(args) do
    Mix.shell().cmd()
  end
end
