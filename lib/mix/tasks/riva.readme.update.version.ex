defmodule Mix.Tasks.Riva.Readme.Update.Version do
  @moduledoc "Printed when the user requests `mix help echo`"
  @shortdoc "Update the version number in README.md"

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    {parsed, _, _} = OptionParser.parse(args, strict: [version: :string])

    {:ok, content} = File.read("README.md")

    # specify your release version here
    release_version = Keyword.get(parsed, :version)

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
end
