defmodule Queuerbackend.Queue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "queues" do
    field :head, :string
    field :maxLength, :integer
    field :name, :string
    field :queuers ,{:array, :string}
    timestamps()
  end

  @doc false
  def changeset(queue, attrs) do
    queue
    |> cast(attrs, [:name, :maxLength, :head, :queuers])
    |> validate_required([:name, :maxLength, :head])
  end
end
