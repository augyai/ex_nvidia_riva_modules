defmodule ExNvidiaRivaModules.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_nvidia_riva_modules,
      version: "2.11.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Precompiled GRPC Modules for nvidia riva",
      aliases: aliases(),
      package: package()
    ]
  end

  defp package do
    [
      maintainers: ["Ed Vazquez"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/augyai/ex_nvidia_riva_modules"}
    ]
  end

  defp aliases do
    [c: "compile"]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.5.0"},
      {:protobuf, "~> 0.10.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
