defmodule Queuerbackend.Repo.Migrations.CreateQueues do
  use Ecto.Migration

  def change do
    create table(:queues) do
      add :name, :string
      add :maxLength, :integer
      add :head, :string

      timestamps()
    end

  end
end
