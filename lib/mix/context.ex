defmodule Mix.Context do
  alias Mix.Context

  defstruct elixir_version: nil,
            elixir_version_major_and_minor: nil,
            protoc_version: nil,
            nvidia_riva_common_tag: nil,
            module_output_dir: nil

  def new(args) do
    {parsed, _, _} =
      OptionParser.parse(args,
        strict: [
          elixir_version: :string,
          protoc_version: :string,
          nvidia_riva_common_tag: :string,
          module_output_dir: :string
        ]
      )

    # default values for build
    elixir_version =
      Keyword.get(
        parsed,
        :elixir_version,
        elixir_version_from_tool_versions_file(".tool-versions")
      )

    elixir_version_major_and_minor =
      parse_majorand_minor_numbers_from_elixir_version_string(elixir_version)

    protoc_version = Keyword.get(parsed, :protoc_version, "23.1")
    nvidia_riva_common_tag = Keyword.get(parsed, :nvidia_riva_common_tag, "r2.11.0")
    module_output_dir = Keyword.get(parsed, :module_output_dir, "./lib/riva")

    %Context{
      elixir_version: elixir_version,
      elixir_version_major_and_minor: elixir_version_major_and_minor,
      protoc_version: protoc_version,
      nvidia_riva_common_tag: nvidia_riva_common_tag,
      module_output_dir: module_output_dir
    }
  end

  defp parse_tool_versions_file(file_path) do
    file_path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      [tool, version] = String.split(line)
      {String.to_atom(tool), version}
    end)
    |> Enum.into([])
  end

  defp elixir_version_from_tool_versions_file(file_path) do
    file_path
    |> parse_tool_versions_file
    |> Keyword.get(:elixir)
  end

  defp parse_majorand_minor_numbers_from_elixir_version_string(elixir_version) do
    Regex.run(~r/^[0-9]+\.[0-9]+/, elixir_version)
  end
end
