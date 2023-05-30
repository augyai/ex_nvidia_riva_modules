defmodule Mix.Tasks.Riva.Hex.Build do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Compile nvidia riva elixir modules from common proto definitions"

  use Mix.Task

  alias Mix.Context

  @impl Mix.Task
  def run(args) do
    ctx = Context.new(args)
    cmd = "earthly -P --ci \
      --build-arg ELIXIR_VERSION=\"#{ctx.elixir_version}\" \
      --build-arg PROTOC_VERSION=\"#{ctx.protoc_version}\" \
      --build-arg NVIDIA_RIVA_COMMON_TAG=\"#{ctx.nvidia_riva_common_tag}\" \
      +package"

    IO.inspect(cmd)
    Mix.shell().cmd(cmd)
  end
end
