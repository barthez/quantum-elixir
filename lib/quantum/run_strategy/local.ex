defmodule Quantum.RunStrategy.Local do
  @moduledoc """
  Run job on local node

  ### Mix Configuration

      config :my_app, MyApp.Scheduler,
        jobs: [
          # Run on local node
          [schedule: "* * * * *", run_strategy: Quantum.RunStrategy.Local]
        ]

  """

  @type t :: %__MODULE__{nodes: nil}

  defstruct nodes: nil

  @behaviour Quantum.RunStrategy

  alias Quantum.Job

  @spec normalize_config!(any) :: t
  def normalize_config!(_), do: %__MODULE__{}

  defimpl Quantum.RunStrategy.NodeList do
    @spec nodes(any, Job.t()) :: [Node.t()]
    def nodes(_, _) do
      [node()]
    end
  end
end
