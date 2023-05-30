defmodule Mix.Tasks.Riva.Modules.Compile do
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
      --artifact +build/riva #{ctx.module_output_dir}"

    IO.inspect(cmd)
    Mix.shell().cmd(cmd)
    update_package_version(ctx.nvidia_riva_common_tag)
    update_readme_version(ctx.nvidia_riva_common_tag)
    update_elixir_version(ctx.elixir_version_major_and_minor)
  end

  defp update_readme_version(tag) do
    {:ok, content} = File.read("README.md")

    release_version = Regex.replace(~r/^[^0-9]*/, tag, "")
    # perform the regex replacement
    new_content =
      Regex.replace(
        ~r/(\{:ex_nvidia_riva_modules, \")~>[^"]+"/,
        content,
        "\\1~> #{release_version}\""
      )

    # write the modified content back to the file
    File.write!("README.md", new_content)
  end

  defp update_package_version(tag) do
    {:ok, content} = File.read("mix.exs")

    release_version = Regex.replace(~r/^[^0-9]*/, tag, "")
    # perform the regex replacement
    new_content =
      Regex.replace(
        ~r/(version:\s*)"[0-9]+\.[0-9]+"/,
        content,
        "\\1\"#{release_version}\""
      )

    # write the modified content back to the file
    File.write!("mix.exs", new_content)
  end

  defp update_elixir_version(elixir_version) do
    {:ok, content} = File.read("mix.exs")

    # perform the regex replacement
    new_content =
      Regex.replace(
        ~r/(elixir: ~>) "[0-9]+\.[0-9]+"/,
        content,
        "\\1 \"#{elixir_version}\""
      )

    # write the modified content back to the file
    File.write!("mix.exs", new_content)
  end
end
