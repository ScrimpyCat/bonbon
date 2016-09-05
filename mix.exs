defmodule Bonbon.Mixfile do
    use Mix.Project

    def project do
        [
            app: :bonbon,
            version: "0.0.1",
            elixir: "~> 1.2",
            elixirc_paths: elixirc_paths(Mix.env),
            compilers: [:phoenix, :gettext] ++ Mix.compilers,
            build_embedded: Mix.env == :prod,
            start_permanent: Mix.env == :prod,
            aliases: aliases,
            deps: deps,
            dialyzer: [plt_add_deps: :transitive]
        ]
    end

    # Configuration for the OTP application.
    #
    # Type `mix help compile.app` for more information.
    def application do
        [
            mod: { Bonbon, [] },
            applications: [
                :phoenix,
                :phoenix_pubsub,
                :cowboy,
                :logger,
                :gettext,
                :phoenix_ecto,
                :postgrex,
                :absinthe,
                :absinthe_plug,
                :poison,
                :decimal,
                :translecto,
                :ecto_enum
            ]
        ]
    end

    # Specifies which paths to compile per environment.
    defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
    defp elixirc_paths(_),     do: ["lib", "web"]

    # Specifies your project dependencies.
    #
    # Type `mix help deps` for examples and options.
    defp deps do
        [
            { :phoenix, "~> 1.2.0" },
            { :phoenix_pubsub, "~> 1.0" },
            { :phoenix_ecto, "~> 3.0" },
            { :postgrex, ">= 0.0.0" },
            { :gettext, "~> 0.11" },
            { :cowboy, "~> 1.0" },
            { :absinthe, "~> 1.1.0" },
            { :absinthe_plug, "~> 1.1" },
            { :poison, "~> 2.2" },
            { :decimal, "~> 1.1.2" },
            { :translecto, "~> 0.0.1" },
            { :ecto_enum, github: "gjaldon/ecto_enum", branch: "ecto-2.0" }, #until ecto_enum on hex is updated to incorporate ecto-2.0 branch
            { :httpoison, "~> 0.9", only: :dev },
            { :floki, "~> 0.10", only: :dev },
            { :ex_doc, "~> 0.13", only: :dev }
        ]
    end

    # Aliases are shortcuts or tasks specific to the current project.
    # For example, to create, migrate and run the seeds file at once:
    #
    #     $ mix ecto.setup
    #
    # See the documentation for `Mix` for more info on aliases.
    defp aliases do
        [
            "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
            "ecto.reset": ["ecto.drop", "ecto.setup"],
            "test": ["ecto.create --quiet", "ecto.migrate", "test"]
        ]
    end
end
