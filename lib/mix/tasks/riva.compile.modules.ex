defmodule Mix.Tasks.Riva.Compile.Modules do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Compile nvidia riva elixir modules from common proto definitions"

  use Mix.Task

  @switches [
    tag: :string
  ]

  @impl Mix.Task
  def run(args) do
    {parsed, _, _} = OptionParser.parse(args, strict: [tag: :string, output: :string])
    tag = Keyword.get(parsed, :tag, "stable")
    output = Keyword.get(parsed, :output, "./lib/riva")
    cmd = "earthly -P --ci --build-arg TAG=#{tag} --artifact +build/riva #{output}"

    IO.inspect(cmd)
    Mix.shell().cmd(cmd)
  end
end
