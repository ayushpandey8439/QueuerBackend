defmodule Queuerbackend.Repo.Migrations.CreateQueues do
  use Ecto.Migration

  def change do
    alter table(:queues) do
      add :queuers ,{:array, :string}
    end

  end
end
